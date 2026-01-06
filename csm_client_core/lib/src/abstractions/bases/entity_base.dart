import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents a business entity.
///
/// [TEntity] - type of the entity, used for inferred operation types.
abstract class EntityBase<TEntity extends IEntity<TEntity>> implements IEntity<TEntity> {
  /// Unique specific object identification.
  @override
  String discriminator = "";

  /// Entity database pointer.
  @override
  BigInt id = BigInt.from(0);

  /// Entity handling timestamp.
  @override
  DateTime timestamp = DateTime.now();

  /// Creates a new instance.
  EntityBase();

  /// Encodes the current [TEntity] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [EntityBase], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  ///
  /// They are being auto encoded from the [EntityBase] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
      EntityKeys.id: id.toString(),
      EntityKeys.discriminator: discriminator,
      EntityKeys.timestamp: timestamp.toIso8601String(),
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return encode;
  }

  /// Decodes the given [DataMap] into the current [TEntity] object, loading the properties bound in the [DataMap].
  ///
  ///
  /// [encode] object storing properties values to load the current [TEntity] instance object.
  ///
  /// When implemented from [EntityBase], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  ///
  /// They are being auto decoded from the [EntityBase] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    id = encode.get(EntityKeys.id);
    timestamp = encode.get(EntityKeys.timestamp);
    discriminator = encode.get(EntityKeys.discriminator);
  }
}
