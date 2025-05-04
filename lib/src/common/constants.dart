import 'package:csm_client/csm_client.dart';

/// {constants} class for [EntityKeys].
///
/// Stores shared key access constants for [EntityI] properties.
final class EntityKeys {

  // --> Entity properties.

  /// Key for [EntityI.id].
  static const String id = 'id';

  /// Key for [EntityI.timestamp] property.
  static const String timestamp = 'timestamp';

  /// Key for [EntityI.discriminator] property.
  static const String discriminator = 'discriminator';

  // --> Named Entity properties.

  /// Ket for [NamedEntityI.name]
  static const String name = 'name';

  /// Key for [NamedEntityI.description] property.
  static const String description = 'description';
}
