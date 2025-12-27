import 'package:csm_client_core/csm_client_core.dart';

/// {implementaiton} class from [ResponseControllerBase].
///
/// Defines final behavior for a [IResponseController], providing a built-in implementation usage.
final class ResponseController extends ResponseControllerBase {
  /// Creates a new [ResponseController] instance.
  const ResponseController(
    super.statusCode, {
    super.data,
    super.exception,
  });
}
