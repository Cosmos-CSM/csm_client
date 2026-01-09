import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents an [EntityI] with [name] and [description] properties
/// that can help to identify a [EntityI] based on [name] property as this defines them as unique.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract interface class NamedReferencedEntityI<TEntity extends IEntity<TEntity>> implements IEntity<TEntity>, ReferencedEntityI<TEntity> {
  /// {Entity} unique name.
  final String name;

  /// {Entity} description.
  final String? description;

  /// Creates a new instance.
  const NamedReferencedEntityI(this.name, this.description);
}

/// Represents an [EntityI] with [name] and [description] properties
/// that can help to identify a [EntityI] based on [name] property as this defines them as unique.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract class NamedReferencedEntityB<T extends IEntity<T>> extends EntityBase<T> implements NamedReferencedEntityI<T> {
  /// [EntityI] unique name.
  @override
  String name = "";

  /// [EntityI] description.
  @override
  String? description;

  /// Unique reference value.
  ///
  /// It's lenght must be strict 8.
  @override
  String reference = '';

  /// Encodes the current [T] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [NamedReferencedEntityB], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  /// - [reference]
  ///
  /// They are being auto encoded from the [NamedReferencedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
      CorePropertiesConsts.name: name,
      CorePropertiesConsts.reference: reference,
      CorePropertiesConsts.description: description,
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return super.encode(encode);
  }

  /// Decodes the given [DataMap] into the current [T] object, loading the properties bound in the [DataMap].
  ///
  ///
  /// [encode] object storing properties values to load the current [T] instance object.
  ///
  /// When implemented from [NamedReferencedEntityB], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  /// - [reference]
  ///
  /// They are being auto decoded from the [NamedReferencedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    super.decode(encode);
    name = encode.get(CorePropertiesConsts.name);
    reference = encode.get(CorePropertiesConsts.reference);
    description = encode.get(CorePropertiesConsts.description);
  }
}
