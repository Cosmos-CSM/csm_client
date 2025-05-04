import 'package:csm_client/csm_client.dart' show DataMap, TracedException;

/// {interface} for [ResponseControllerI].
///
/// Defines a contract for a [ServiceI] request response controlling interactions.
abstract interface class ResponseControllerI {
  /// Resolves the current [ResponseControllerI].
  ///
  ///
  /// [onSuccess] when the [ResponseControllerI] gets resolved successfuly.
  ///
  /// [onFailure] when the [ResponseControllerI] receives an status code different than {200}.
  ///
  /// [onException] when the [ResponseControllerI] got interrupted by an exception.
  void resolve(
    Function(DataMap data) onSuccess,
    Function(DataMap data, int statusCode) onFailure,
    Function(TracedException exception) onException,
  );
}
