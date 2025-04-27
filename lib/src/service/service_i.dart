import 'package:csm_client/csm_client.dart';

/// [interface] for [ServiceI] implementations.
///
/// Defines a contract for a specific service address and handling at a [ServerI] implementation, a [ServiceI] holds the final endpoints to
/// resolve service calls and operations.
abstract interface class ServiceI {
  /// Service address.
  final Uri address;

  /// [HTTP] communication client.
  final Client client;

  /// Global [ServiceI] context headers to be sent at each [ServiceI] endpoint request.
  final Headers headers;

  /// Creates a new [ServiceI] instance.
  const ServiceI(this.address, this.client, this.headers);

  /// Performs a [POST] method action via network connection to the specified [endpoint]  at the service [address].
  ///
  ///
  /// [T] type of the object model to be sent in the request body.
  ///
  /// [endpoint] last segment of the path from the common used endpoints.
  ///
  /// [body] the request data body.
  ///
  /// [auth] (optional) custom authentication string token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<ResponseController> post<T extends EncodableI>(
    String endpoint,
    T body, {
    String? auth,
    Headers? headers,
  });

  /// Performs a [POST] method action via network connection to the specified [endpoint] at the service [address].
  ///
  ///
  /// [T] type of the object model list to be sent in the request body.
  ///
  /// [endpoint] last segment of the path from the common used endpoints.
  ///
  /// [body] the request data body.
  ///
  /// [auth] (optional) custom authentication string token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<ResponseController> postList<T extends EncodableI>(
    String act,
    List<T> request, {
    String? auth,
    Headers? headers,
  });
}
