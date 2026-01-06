import 'package:csm_client_core/csm_client_core.dart';

/// Represents a server service communication handler.
abstract interface class IService {
  /// Service address.
  final Uri address;

  /// Communication client.
  final Client client;

  /// Service scoped headers
  final Headers headers;

  /// Creates a new instance.
  const IService(
    this.address,
    this.client,
    this.headers,
  );

  /// Perfors a {GET} method http action to the given [endpoint].
  ///
  ///
  /// [endpoint] path relative to the current handler server [address] where the action will be performed to.
  ///
  /// [auth] (optional) custom authentication value token.
  ///
  /// [headers] (optional) headers to be sent at [endpoint] request level.
  Future<IResponseController> get(
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
  Future<IResponseController> post<T extends IEncodable>(
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
  Future<IResponseController> postList<T extends IEncodable>(
    String endpoint,
    List<T> request, {
    String? auth,
    Headers? headers,
  });
}
