import 'package:csm_client/csm_client.dart';
import 'package:meta/meta.dart';

/// [abstract] class for [EntityB].
///
///
/// [T] type of the [EntityB] implementation.
///
/// Defines a data and behavior base implementation for [EntityB] implementations, handles base [encode] / [decode] behavior automatically adding
/// the handled properties.
abstract class EntityB<T extends EntityI<T>> implements EntityI<T> {
  /// Unique specific object identification.
  @override
  String discriminator = "";

  /// Entity database pointer.
  @override
  int id = 0;

  /// Entity handling timestamp.
  @override
  DateTime timestamp = DateTime.now();

  /// Creates a new [EntityB] instance with default values.
  EntityB();

  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object>{
      EntityKeys.id: id,
      EntityKeys.timestamp: timestamp,
      EntityKeys.discriminator: discriminator,
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return encode;
  }

  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    id = encode.get(EntityKeys.id);
    timestamp = encode.get(EntityKeys.timestamp);
    discriminator = encode.get(EntityKeys.discriminator);
  }
}
