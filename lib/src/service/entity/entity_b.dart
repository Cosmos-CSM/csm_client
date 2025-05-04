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

  /// Encodes the current [T] object into a [DataMap] object.
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
      EntityKeys.id: id,
      EntityKeys.discriminator: discriminator,
      EntityKeys.timestamp: timestamp.toIso8601String(),
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return encode;
  }

  /// Decodes the given [DataMap] into the current [T] object, loading the properties bound in the [DataMap].
  ///
  ///
  /// [encode] object storing properties values to load the current [T] instance object.
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
