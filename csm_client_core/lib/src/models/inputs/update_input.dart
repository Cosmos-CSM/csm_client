import 'package:csm_client_core/csm_client_core.dart';

/// {model} class for [UpdateInput].
///
/// Defines a data model class that represents an {input} object for an {Update} operation at the [FoundationServer].
final class UpdateInput<T extends IEntity<T>> implements IEncodable {
  /// Whether the [entity] should be created if there's no an [EntityI] with the same [EntityI.id].
  bool create = false;

  /// [EntityI] implementation object to update, it takes the [EntityI.id] to identify the current object data and then overrides
  /// it with the data in this instance object.
  final T entity;

  /// Creates a new [UpdateInput] instance.
  UpdateInput(this.entity);

  @override
  DataMap encode() {
    return <String, Object?>{
      'create': create,
      'entity': entity.encode(),
    };
  }
}
