import 'package:csm_client_core/csm_client_core.dart';

/// {constants} class for [CorePropertiesConsts].
///
/// Stores shared key access constants for [EntityI] properties.
final class CorePropertiesConsts {
  //! [Entity] properties.

  /// Key for [EntityI.id].
  static const String id = 'id';

  /// Key for [EntityI.timestamp] property.
  static const String timestamp = 'timestamp';

  /// Key for [EntityI.discriminator] property.
  static const String discriminator = 'discriminator';

  //! [Named Entity] properties.

  /// Ket for [INamedEntity.name]
  static const String name = 'name';

  /// Key for [INamedEntity.description] property.
  static const String description = 'description';

  //! [Referenced Entity] properties.

  /// Key for [ReferencedEntityI.reference] property.
  static const String reference = "reference";

  //! [Common Entity] properties.

  /// Key for [CommonEntityI.internal] property.
  static const String internal = 'internal';

  /// Key for [CommonEntityI.external] property.
  static const String external = 'external';

  //! [Activable Entity] properties.
  /// Key for [IActivableEntity.isEnabled] property.
  static const String isEnabled = "isEnabled";
}
