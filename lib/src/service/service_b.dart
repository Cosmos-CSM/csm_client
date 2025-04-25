import 'dart:convert';
import 'dart:core' as core show Uri;
import 'dart:core';
import 'dart:io';

import 'package:csm_client/csm_client.dart';
import 'package:http/http.dart' show Response;
import 'package:meta/meta.dart';

/// [abstract] class for [ServiceB].
///
/// Defines a base behavior for a specific service address at a [ServerI] implementation, a [ServiceI] holds the final endpoints to
/// resolve service calls and operations.
abstract class ServiceB implements ServiceI {
  /// (protected) [CSM] authentication header key.
  @protected
  static const String authKey = 'CSMAuth';

  /// Default headers to indicate a standard [json] request.
  static final Headers _kHeaders = <String, String>{
    "accept-type": 'application/json',
    "content-type": 'application/json',
  };

  /// Service address.
  @override
  late final Uri address;

  /// [HTTP] communication client.
  @override
  late final Client client;

  /// Global [ServiceI] context headers to be sent at each [ServiceI] endpoint request.
  @override
  late final Headers headers;

  /// Generates a new [ServiceB] behavior handler.
  ServiceB(
    Uri host,
    String servicePath, {
    Client? client,
    Headers? headers,
  }) {
    address = Uri.includeEndpoint(host, servicePath);
    client = client ?? Client();
    this.headers = <String, String>{};
    this.headers.addAll(_kHeaders);
    if (headers != null) {
      this.headers.addAll(headers);
    }
  }

  Headers _resolveHeaders(Headers? endpointHeaders) {}

  @override
  Future<CSMActEffect> post<T extends EncodableI>(
    String act,
    T request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(act);
    try {
      headers?.addAll(this.headers);
      headers ??= this.headers;
      if (auth != null) {
        headers[HttpHeaders.authorizationHeader] = '$authKey $auth';
      }

      DataMap reqDataMap = request.encode();
      final Response response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(reqDataMap),
      );
      final DataMap resDataMap = jsonDecode(response.body);
      final int statusCode = response.statusCode;

      return CSMActEffect(
        success: statusCode == 200 ? resDataMap : null,
        error: statusCode != 200 ? resDataMap : null,
        status: statusCode,
      );
    } catch (x, st) {
      return CSMActEffect(
        exception: x,
        trace: st,
      );
    }
  }

  @override
  Future<CSMActEffect> postList<T extends EncodableI>(
    String act,
    List<T> request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(act);
    try {
      headers?.addAll(this.headers);
      headers ??= this.headers;
      if (auth != null) {
        headers[HttpHeaders.authorizationHeader] = '$authKey $auth';
      }

      List<DataMap> jObject = request.map<DataMap>((T e) => e.encode()).toList();
      final Response response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(jObject),
      );
      final DataMap parsedBody = jsonDecode(response.body);
      final int statusCode = response.statusCode;
      if (response.statusCode == 200) return CSMActEffect(success: parsedBody, status: 200);
      return CSMActEffect(error: parsedBody, status: statusCode);
    } catch (x, st) {
      return CSMActEffect(exception: x, trace: st);
    }
  }
}
