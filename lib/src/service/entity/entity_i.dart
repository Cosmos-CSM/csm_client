import 'package:csm_client/csm_client.dart';

/// [Interface] for [Entities] implementations. Specifies every necessary member for a business entity.
abstract interface class EntityI implements EncodableI, DecodableI, VariationI {
  /// Entity database pointer.
  late int id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Creates a new [EntityI] instance with default values.
  EntityI();

  /// Client level evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<EntityInvalidation> evaluate();
}
