import 'package:csm_client_core/csm_client_core.dart';

/// {interface} for [IResponseResolver].
///
///
/// [T] type of the response data object.
///
/// Defines a behavior contract for a [IResponseResolver] implementation, wich handles the data convertion between the service request response
/// and the final client API usage, providing directly the object resolutions.
abstract interface class IResponseResolver<T> {
  /// Low level response controller.
  final IResponseController responseController;

  /// Creates a new [IResponseResolver] instance.
  const IResponseResolver(this.responseController);
}
