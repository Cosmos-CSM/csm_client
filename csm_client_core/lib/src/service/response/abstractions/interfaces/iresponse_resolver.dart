import 'package:csm_client_core/csm_client_core.dart';

/// {interface} for [IResponseResolver].
///
///
/// [TResponseData] - Type of the response result data.
///
/// Defines a behavior contract for a [IResponseResolver] implementation, wich handles the data convertion between the service request response
/// and the final client API usage, providing directly the object resolutions.
abstract interface class IResponseResolver<TResponseData extends IDecodable> {
  /// Low level response controller.
  final IResponseController responseController;

  /// Creates a new [IResponseResolver] instance.
  const IResponseResolver(this.responseController);

  /// Resolves the [ResponseController] directly with no callback handlers.
  ///
  /// [factory] building callback for the [TResponseData] object creation in order to call [IDecodable.decode] method.
  TResponseData resolveDirect(TResponseData Function() factory);

  /// Resolves the [ResponseController] with the given callback handlers.
  ///
  /// [factory] building callback for the [TResponseData] object creation in order to call [IDecodable.decode] method.
  ///
  /// [onSuccess] callback invoked when the [ResponseController] resulted in a success.
  ///
  /// [onFailure] callback invoked when the [ResponseController] resulted in a server failure.
  ///
  /// [onException] callback invoked when the [ResponseController] resulted in a client-side exception.
  ///
  /// [onConnectionFailure] callback invoked when the [ResponseController] resulted in an exception related with connection failure.
  ///
  /// [onFinally] callback invoked after any [ResponseController] result and callback invokation.
  void resolve({
    TResponseData Function() factory,
    void Function(SuccessFrame<TResponseData> success) onSuccess,
    required void Function(FailureFrame failure, int status) onFailure,
    required void Function(TracedException exception) onException,
    required void Function() onConnectionFailure,
    void Function()? onFinally,
  });
}
