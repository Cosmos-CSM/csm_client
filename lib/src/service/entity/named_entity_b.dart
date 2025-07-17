import 'package:csm_client/csm_client.dart';
import 'package:meta/meta.dart';


/// Represents an [EntityI] with [name] and [description] properties
/// that can help to identify a [EntityI] based on [name] property as this defines them as unique.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract interface class NamedEntityI<TEntity extends EntityI<TEntity>> implements EntityI<TEntity> {
  /// {Entity} unique name.
  final String name;

  /// {Entity} description.
  final String? description;

  /// Creates a new instance.
  const NamedEntityI(this.name, this.description);
}

/// Represents an [EntityI] with [name] and [description] properties
/// that can help to identify a [EntityI] based on [name] property as this defines them as unique.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract class NamedEntityB<T extends EntityI<T>> extends EntityB<T> implements NamedEntityI<T> {
  /// [EntityI] unique name.
  @override
  String name = "";

  /// [EntityI] description.
  @override
  String? description;

  /// Encodes the current [T] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [NamedEntityB], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  ///
  /// They are being auto encoded from the [NamedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
        EntityKeys.name: name,
        EntityKeys.description: description,
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
  /// When implemented from [NamedEntityB], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [name]
  /// - [description]
  ///
  /// They are being auto decoded from the [NamedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    super.decode(encode);
    name = encode.get(EntityKeys.name);
    description = encode.get(EntityKeys.description);
  }
}
