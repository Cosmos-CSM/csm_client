import 'package:csm_client/csm_client.dart';

/// [abstract] definition for [NamedEntities] simplification management.
abstract class NamedEntityB<TEntity extends EntityI<TEntity>> extends EntityB<TEntity> implements NamedEntityI<TEntity> {
  /// [Entity] unique name.
  @override
  String name = "";

  /// [Entity] description.
  @override
  String? description;
}
