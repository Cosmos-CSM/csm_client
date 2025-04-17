import 'package:csm_client/src/service/entity_i.dart';

/// [interface] definition for [entities] that are named.
abstract interface class NamedEntityI<TEntity extends EntityI<TEntity>> implements EntityI<TEntity> {
  /// [Entity] unique name.
  late String name;

  /// [Entity] description.
  late String? description;
}
