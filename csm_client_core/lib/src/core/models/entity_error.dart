import 'package:csm_client_core/csm_client_core.dart';

/// {model} class for [EntityErrors].
///
///
/// [T] type of the [EntityI] invalidation result.
///
/// Defines a storage contract for an invalid property exception got at [EntityI] validation process.
final class EntityErrors<T extends Object> {
  /// Invalid entity instance.
  final T entity;

  /// Invalid property information.
  final PropertyInfo property;

  /// User friendly invalidation reason description.
  final String reason;

  /// Low level rules tryed to be applied.
  final String rules;

  /// Creates a new [EntityErrors] instance.
  const EntityErrors(this.entity, this.property, this.reason, this.rules);
}
