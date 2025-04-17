import 'package:csm_client/csm_client.dart';
import 'package:csm_client/src/service/decoding/csm_decodable.dart';

/// [Interface] for [Entities] implementations. Specifies every necessary member for a business entity.
abstract interface class EntityI<TEntity extends EntityI<TEntity>> implements CSMEncodable, CSMDecodable<TEntity> {
  /// Entity database pointer.
  late int id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Client level evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<CSMEntityInvalidProperty> evaluate();
}
