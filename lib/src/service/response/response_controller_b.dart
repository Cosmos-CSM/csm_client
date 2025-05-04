import 'package:csm_client/csm_client.dart';
import 'package:meta/meta.dart';

/// {abstract} class for [ResponseControllerB] implementations.
///
/// Defines a base behavior for [ResponseControllerB] implementations that resolves behaviors dependending on the response data.
abstract class ResponseControllerB implements ResponseControllerI {
  /// Data object gathered from the response body.
  @protected
  final DataMap data;

  /// {HTTP} request status code, this is a global netwroking standard.
  @protected
  final int statusCode;

  /// Exception caught during request.
  @protected
  final TracedException? exception;

  /// Generates a [ResponseControllerB] behavior handler.
  const ResponseControllerB(
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
