import 'package:csm_client/src/service/csm_entity_interface.dart';

/// [interface] definition for [entities] that are named.
abstract interface class CSMNamedEntityInterface implements CSMEntityInterface {
  /// [Entity] unique name.
  late String name;

  /// [Entity] description.
  late String? description;
}
