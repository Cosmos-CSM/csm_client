import 'dart:convert';
import 'dart:core' as core show Uri;
import 'dart:core';
import 'dart:io';

import 'package:csm_client/csm_client.dart';
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
    this.client = client ?? Client();
    this.headers = <String, String>{};
    this.headers.addAll(_kHeaders);
    if (headers != null) {
      this.headers.addAll(headers);
    }
  }

  /// Resolves a [Headers] object based on the endpoint context given [Headers] and whether it needs [authToken].
  ///
  ///
  /// [endpointHeaders] headers for the endpoint request scope.
  ///
  /// [authToken] token for request authentication when the endpoint needs it.
  Headers _resolveHeaders(Headers? endpointHeaders, [String? authToken]) {
    endpointHeaders?.addAll(headers);
    endpointHeaders ??= headers;
    if (authToken != null) {
      headers[HttpHeaders.authorizationHeader] = '$authKey $authToken';
    }

    return endpointHeaders;
  }

  @override
  Future<ResponseController> post<T extends EncodableI>(
    String act,
    T request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(act);
    try {
      headers = _resolveHeaders(headers, auth);

      DataMap reqDataMap = request.encode();
      final Response response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(reqDataMap),
      );
      final DataMap resDataMap = jsonDecode(response.body);
      final int statusCode = response.statusCode;

      return ResponseController(
        statusCode,
        data: resDataMap,
      );
    } catch (exception, stackTrace) {
      return ResponseController(
        500,
        exception: TracedException(exception, stackTrace),
      );
    }
  }

  @override
  Future<ResponseController> postList<T extends EncodableI>(
    String act,
    List<T> request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(act);
    try {
      headers = _resolveHeaders(headers, auth);

      List<DataMap> jObject = request.map<DataMap>((T e) => e.encode()).toList();
      final Response response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(jObject),
      );
      final DataMap parsedBody = jsonDecode(response.body);
      final int statusCode = response.statusCode;

      return ResponseController(
        statusCode,
        data: parsedBody,
      );
    } catch (exception, stackTrace) {
      return ResponseController(
        500,
        exception: TracedException(exception, stackTrace),
      );
    }
  }
}
