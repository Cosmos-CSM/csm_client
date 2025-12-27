import 'package:csm_client_core/csm_client_core.dart';

/// {implementaiton} class from [ResponseControllerB].
///
/// Defines final behavior for a [ResponseControllerI], providing a built-in implementation usage.
final class ResponseController extends ResponseControllerB {
  /// Creates a new [ResponseController] instance.
  const ResponseController(
    super.statusCode, {
    super.data,
    super.exception,
  });
}
