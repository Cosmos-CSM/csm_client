import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents an [IEntity] with [name] and [description] properties
/// that can help to identify a [IEntity] based on [name] property as this defines them as unique.
///
///
/// [TEntity] - Type of the [IEntity] implementation.
abstract class NamedEntityBase<TEntity extends INamedEntity<TEntity>> extends EntityBase<TEntity> implements INamedEntity<TEntity> {
  /// [EntityI] unique name.
  @override
  String name = "";

  /// [EntityI] description.
  @override
  String? description;

  /// Encodes the current [TEntity] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [NamedEntityBase], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  ///
  /// They are being auto encoded from the [NamedEntityBase] base behavior.
  @override
  @mustCallSuper
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
      CorePropertiesConsts.name: name,
      CorePropertiesConsts.description: description,
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return super.encode(encode);
  }

  /// Decodes the given [DataMap] into the current [TEntity] object, loading the properties bound in the [DataMap].
  ///
  ///
  /// [encode] object storing properties values to load the current [TEntity] instance object.
  ///
  /// When implemented from [NamedEntityBase], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  ///
  /// They are being auto decoded from the [NamedEntityBase] base behavior.
  @override
  @mustCallSuper
  void decode(DataMap encode) {
    super.decode(encode);
    name = encode.get(CorePropertiesConsts.name);
    description = encode.get(CorePropertiesConsts.description);
  }

  @override
  @mustCallSuper
  List<EntityErrors<TEntity>> evaluate(List<EntityErrors<TEntity>> errors) {
    if (errors.isEmpty) {
      errors = <EntityErrors<TEntity>>[];
    }

    if (name.isEmpty) {
      errors.add(
        EntityErrors<TEntity>(
          this as TEntity,
          PropertyInfo(
            CorePropertiesConsts.name,
            String,
            name,
          ),
          CoreEntityErrorReasonsConsts.cantBeEmpty,
          'Can\'t be empty',
        ),
      );
    }

    return errors;
  }

  @override
  @mustCallSuper
  List<ObjectDifference> compare(TEntity ref, [List<ObjectDifference> aggregated = const <ObjectDifference>[]]) {
    if (name != ref.name) {
      aggregated.add(
        ObjectDifference(
          PropertyInfo('name', String, name),
          name,
          ref.name,
          null,
        ),
      );
    }

    if (description != ref.description) {
      aggregated.add(
        ObjectDifference(
          PropertyInfo('description', String, description),
          description,
          ref.description,
          null,
        ),
      );
    }

    return super.compare(ref, aggregated);
  }
}
