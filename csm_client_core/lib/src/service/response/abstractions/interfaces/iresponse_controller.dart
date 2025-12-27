import 'package:csm_client_core/csm_client_core.dart' show DataMap, TracedException;

/// {interface} for [IResponseController].
///
/// Defines a contract for a [ServiceI] request response controlling interactions.
abstract interface class IResponseController {
  /// Resolves the current [IResponseController].
  ///
  ///
  /// [onSuccess] when the [IResponseController] gets resolved successfuly.
  ///
  /// [onFailure] when the [IResponseController] receives an status code different than {200}.
  ///
  /// [onException] when the [IResponseController] got interrupted by an exception.
  void resolve(
    Function(DataMap data) onSuccess,
    Function(DataMap data, int statusCode) onFailure,
    Function(TracedException exception) onException,
  );
}
