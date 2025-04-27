import 'package:csm_client/csm_client.dart';

/// [abstract] definition for [NamedEntities] simplification management.
abstract class NamedEntityB extends EntityB implements NamedEntityI {
  /// [Entity] unique name.
  @override
  String name = "";

  /// [Entity] description.
  @override
  String? description;
}
