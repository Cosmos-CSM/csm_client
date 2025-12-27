import 'dart:convert';
import 'dart:core' as core show Uri;
import 'dart:core';
import 'dart:io';

import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents a server service communication handler.
abstract class ServiceBase implements IService {
  /// CSM Framework authentication header key.
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

  /// Communication client.
  @override
  late final Client client;

  /// Service scoped headers..
  @override
  late final Headers headers;

  /// Creates a new instance.
  ServiceBase(
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
  Future<ResponseControllerI> get(
    String endpoint, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(endpoint);
    try {
      headers = _resolveHeaders(headers, auth);

      final Response response = await client.get(
        uri,
        headers: headers,
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
  Future<ResponseControllerI> post<T extends EncodableI>(
    String endpoint,
    T request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(endpoint);
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
  Future<ResponseControllerI> postList<T extends EncodableI>(
    String endpoint,
    List<T> request, {
    String? auth,
    Headers? headers,
  }) async {
    core.Uri uri = address.resolve(endpoint);
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
