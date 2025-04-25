import 'dart:convert';
import 'dart:core' as core show Uri;
import 'dart:core';
import 'dart:io';

import 'package:csm_client/csm_client.dart';
import 'package:http/http.dart' show Response;

/// Base for [CSMService].
///
/// Defines base behavior for a [CSMService] implementation.
///
/// [CSMService] concept: is a set of operations where get data by protocol transactions,
/// like an endpoint. (i.e.) google.com/security <-- service; google.com/security/calculate <-- act, where the operation will be solved with data.
abstract class CSMServiceBase implements CSMServiceInterface {
  @override
  late final Uri endpoint;

  @override
  late final Client comm;

  @override
  late final Headers headers;

  /// Default headers to indicate a standard [JSON] transaction.
  static final Headers _kHeaders = <String, String>{
    "accept-type": 'application/json',
    "content-type": 'application/json',
  };

  /// Generates a new [CSMServiceBase] behavior handler.
  CSMServiceBase(
    Uri host,
    String servicePath, {
    Client? client,
    Headers? headers,
  }) {
    endpoint = Uri.includeEndpoint(host, servicePath);
    comm = client ?? Client();
    this.headers = <String, String>{};
    this.headers.addAll(_kHeaders);
    if (headers != null) {
      this.headers.addAll(headers);
    }
  }

  @override
  Future<CSMActEffect> post<M extends EncodableI>(
    String act,
    M request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = endpoint.resolve(act);
    try {
      if (headers == null) {
        headers = this.headers;
      } else {
        headers.addAll(this.headers);
      }

      if (auth != null) {
        headers[HttpHeaders.authorizationHeader] = '${CSMServiceInterface.authKey} $auth';
      }

      DataMap jObject = request.encode();
      final Response response = await comm.post(
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

  @override
  Future<CSMActEffect> postList<M extends EncodableI>(
    String act,
    List<M> request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = endpoint.resolve(act);
    try {
      if (headers == null) {
        headers = this.headers;
      } else {
        headers.addAll(this.headers);
      }
      if (auth != null) {
        headers[HttpHeaders.authorizationHeader] = '${CSMServiceInterface.authKey} $auth';
      }

      List<DataMap> jObject = request.map<DataMap>((M e) => e.encode()).toList();
      final Response response = await comm.post(
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
