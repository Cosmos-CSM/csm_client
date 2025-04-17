import 'package:csm_client/csm_client.dart';
import 'package:csm_client/src/common/constants/entity_keys.dart';
import 'package:meta/meta.dart';

/// [Abstract] class for [Entities] base members handling and operations.
abstract class EntityB implements EntityI {
  /// Unique specific object identification.
  @override
  String discriminator = "";

  /// Entity database pointer.
  @override
  int id = 0;

  /// Entity handling timestamp.
  @override
  DateTime timestamp = DateTime.now();

  @override
  @mustCallSuper
  @mustBeOverridden
  JObject encode([JObject? entityObject]) {
    JObject encode = <String, Object>{
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
  void decode(JObject encode) {
    id = encode.get(EntityKeys.id);
    timestamp = encode.get(EntityKeys.timestamp);
    discriminator = encode.get(EntityKeys.discriminator);
  }
}
