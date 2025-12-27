import 'package:csm_client_core/csm_client_core.dart';

/// {abstract} class for [ResponseResolverB] implementations.
///
///
/// [T] type of the response data object.
///
/// Defines base behavior for [ResponseResolverI] implementations, provides base built-in interactions for response resolution.
abstract class ResponseResolverB<T> implements ResponseResolverI<T> {
  /// Low level response controller.
  @override
  final ResponseControllerI responseController;

  /// Creates a new [ResponseResolverB] instance.
  const ResponseResolverB(this.responseController);
}
