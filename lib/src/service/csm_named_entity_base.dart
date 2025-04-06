import 'package:csm_client/src/service/csm_entity_base.dart';
import 'package:csm_client/src/service/csm_named_entity_interface.dart';

/// [abstract] definition for [NamedEntities] simplification management.
abstract class CSMNamedEntityBase extends CSMEntityBase implements CSMNamedEntityInterface {
  /// [Entity] unique name.
  @override
  String name = "";

  /// [Entity] description.
  @override
  String? description;
}
