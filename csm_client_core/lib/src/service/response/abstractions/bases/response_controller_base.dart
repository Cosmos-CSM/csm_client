import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// {abstract} class for [ResponseControllerBase] implementations.
///
/// Defines a base behavior for [ResponseControllerBase] implementations that resolves behaviors dependending on the response data.
abstract class ResponseControllerBase implements IResponseController {
  /// Data object gathered from the response body.
  @protected
  final DataMap data;

  /// {HTTP} request status code, this is a global netwroking standard.
  @protected
  final int statusCode;

  /// Exception caught during request.
  @protected
  final TracedException? exception;

  /// Generates a [ResponseControllerBase] behavior handler.
  const ResponseControllerBase(
    this.statusCode, {
    this.exception,
    this.data = const <String, Object?>{},
  });

  @override
  void resolve(
    Function(DataMap data) onSuccess,
    Function(DataMap data, int statusCode) onFailure,
    Function(TracedException exception) onException,
  ) {
    if (exception != null) {
      onException(exception!);
      return;
    }

    if (statusCode != 200) {
      onFailure(data, statusCode);
      return;
    }

    onSuccess(data);
  }
}
