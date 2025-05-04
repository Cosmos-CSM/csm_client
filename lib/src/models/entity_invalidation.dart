import 'package:csm_client/csm_client.dart';

/// {model} class for [EntityInvalidation].
/// 
/// 
/// [T] type of the [EntityI] invalidation result.
///
/// Defines a storage contract for an invalid property exception got at [EntityI] validation process.
final class EntityInvalidation<T extends Object> {
  /// Invalid entity instance.
  final T entity;

  /// Invalid property information.
  final PropertyInfo property;

  /// User friendly invalidation reason description.
  final String reason;

  /// Low level rules tryed to be applied.
  final String rules;

  /// Creates a new [EntityInvalidation] instance.
  const EntityInvalidation(this.entity, this.property, this.reason, this.rules);
}
