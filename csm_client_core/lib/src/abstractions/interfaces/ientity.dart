import 'package:csm_client_core/csm_client_core.dart';

/// Represents a business entity.
///
/// [TEntity] - type of the entity, used for inferred operation types.
abstract interface class IEntity<TEntity extends IEntity<TEntity>> implements IEncodable, IDecodable, IVariation {
  /// Entity database pointer.
  late BigInt id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Creates a new instance.
  IEntity();

  /// Client-side evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<EntityErrors<TEntity>> evaluate(List<EntityErrors<TEntity>> errors);
}
