import 'package:csm_client_core/csm_client_core.dart';

/// {abstract} class for [ResponseResolverBase] implementations.
///
///
/// [TResponseData] type of the response data object.
///
/// Defines base behavior for [IResponseResolver] implementations, provides base built-in interactions for response resolution.
abstract class ResponseResolverBase<TResponseData extends IDecodable?> implements IResponseResolver<TResponseData> {
  /// Low level response controller.
  @override
  final IResponseController responseController;

  /// Creates a new [ResponseResolverBase] instance.
  const ResponseResolverBase(this.responseController);
}
