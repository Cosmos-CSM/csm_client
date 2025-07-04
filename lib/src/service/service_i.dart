import 'package:csm_client/csm_client.dart';

/// {interface} for [ServiceI] implementations.
///
/// Defines a contract for a specific service address and handling at a [ServerI] implementation, a [ServiceI] holds the final endpoints to
/// resolve service calls and operations.
abstract interface class ServiceI {
  /// Service address.
  final Uri address;

  /// {HTTP} communication client.
  final Client client;

  /// Global [ServiceI] context headers to be sent at each [ServiceI] endpoint request.
  final Headers headers;

  /// Creates a new [ServiceI] instance.
  const ServiceI(this.address, this.client, this.headers);

  /// Perfors a {GET} method http action to the given [endpoint].
  ///
  ///
  /// [endpoint] path relative to the current handler server [address] where the action will be performed to.
  ///
  /// [auth] (optional) custom authentication value token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<ResponseControllerI> get(
    String endpoint, {
    String? auth,
    Headers? headers,
  });

  /// Performs a {POST} method action via network connection to the specified {endpoint}  at the service [address].
  ///
  ///
  /// [T] type of the object model to be sent in the request body.
  ///
  ///
  /// [endpoint] path relative to the current handler server [address] where the action will be performed to.
  ///
  /// [body] the request data body.
  ///
  /// [auth] (optional) custom authentication string token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<ResponseControllerI> post<T extends EncodableI>(
    String endpoint,
    T body, {
    String? auth,
    Headers? headers,
  });

  /// Performs a {POST} method action via network connection to the specified {endpoint} at the service [address].
  ///
  ///
  /// [T] type of the object model list to be sent in the request body.
  ///
  ///
  /// [endpoint] path relative to the current handler server [address] where the action will be performed to.
  ///
  /// [body] the request data body.
  ///
  /// [auth] (optional) custom authentication string token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<ResponseControllerI> postList<T extends EncodableI>(
    String endpoint,
    List<T> request, {
    String? auth,
    Headers? headers,
  });
}
