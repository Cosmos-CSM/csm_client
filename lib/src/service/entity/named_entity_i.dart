import 'package:csm_client/src/service/entity/entity_i.dart';

/// {interface} for [NamedEntityI].
///
/// [T] type of the [NamedEntityI] implementation.
///
///
/// Defines a data / behavior contract for [NamedEntityI] implementations wich are [EntityI] implementations with the addition of [name] and [description] properties, are business entities
/// with unique identificable names and descriptions (descriptions are not unique neither mandatory).
abstract interface class NamedEntityI<T extends EntityI<T>> implements EntityI<T> {
  /// {Entity} unique name.
  final String name;

  /// {Entity} description.
  final String? description;

  /// Creates a new [NamedEntityI] instance.
  const NamedEntityI(this.name, this.description);
}
