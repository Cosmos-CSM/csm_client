import 'package:csm_client/csm_client.dart';

/// {abstract} class for [ResponseResolverB] implementations.
///
///
/// [T] type of the response data object.
///
/// Defines base behavior for [ResponseResolverI] implementations, provides base built-in interactions for response resolution.
abstract class ResponseResolverB<T> implements ResponseResolverI<T> {
  /// Low level response controller.
  @override
  final ResponseController controller;

  /// Creates a new [ResponseResolverB] instance.
  const ResponseResolverB(this.controller);
}
