import 'package:csm_client/csm_client.dart';
import 'package:meta/meta.dart';


/// Represents a tenant business live stored entity model, that usually are objects wich data are grouped by bound that 
/// instrinsictly defines their own.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract interface class EntityI<TEntity extends EntityI<TEntity>> implements EncodableI, DecodableI, VariationI {
  /// Entity database pointer.
  late BigInt id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Creates a new instance.
  EntityI();

  /// Client-side evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<EntityInvalidation<TEntity>> evaluate();
}

/// Represents a tenant business live stored entity model, that usually are objects wich data are grouped by bound that
/// instrinsictly defines their own.
/// 
/// 
/// [TEntity] type of the [EntityI] implementation.
abstract class EntityB<TEntity extends EntityI<TEntity>> implements EntityI<TEntity> {
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
  EntityB();

  /// Encodes the current [TEntity] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [EntityB], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  ///
  /// They are being auto encoded from the [EntityB] base behavior.
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
  /// When implemented from [EntityB], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  ///
  /// They are being auto decoded from the [EntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    id = encode.get(EntityKeys.id);
    timestamp = encode.get(EntityKeys.timestamp);
    discriminator = encode.get(EntityKeys.discriminator);
  }
}
