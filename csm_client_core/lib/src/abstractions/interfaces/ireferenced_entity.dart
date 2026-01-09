import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] with a unique [reference] value.
abstract interface class IReferencedEntity<TEntity extends IEntity<TEntity>> implements IEntity<TEntity>, IVariation {
  /// Unique reference value.
  ///
  /// It's lenght must be strict 8.
  final String reference;

  /// Creates a new instance.
  const IReferencedEntity(this.reference);
}
