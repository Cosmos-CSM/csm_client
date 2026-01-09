import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] that can be activated or deactivated,
abstract interface class IActivableEntity<TEntity extends IEntity<TEntity>> implements IEntity<TEntity>, IVariation {
  /// Indicates whether the entity is active or not.
  final bool isEnabled;

  /// Creates a new instance.
  const IActivableEntity(this.isEnabled);
}
