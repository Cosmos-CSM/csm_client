import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] with [name] and [description] properties
/// that can help to identify a [EntityI] based on [name] property as this defines them as unique.
///
///
/// [TEntity] type of the [IEntity] implementation.
abstract interface class INamedEntity<TEntity extends IEntity<TEntity>> implements IEntity<TEntity> {
  /// {Entity} unique name.
  final String name;

  /// {Entity} description.
  final String? description;

  /// Creates a new instance.
  const INamedEntity(this.name, this.description);
}
