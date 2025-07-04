import 'package:csm_client/csm_client.dart';

/// {interface} for [ResponseResolverI].
///
///
/// [T] type of the response data object.
///
/// Defines a behavior contract for a [ResponseResolverI] implementation, wich handles the data convertion between the service request response
/// and the final client API usage, providing directly the object resolutions.
abstract interface class ResponseResolverI<T> {
  /// Low level response controller.
  final ResponseControllerI responseController;

  /// Creates a new [ResponseResolverI] instance.
  const ResponseResolverI(this.responseController);
}
