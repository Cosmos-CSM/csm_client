import 'package:csm_client/csm_client.dart';

/// [Interface] for [Entities] implementations. Specifies every necessary member for a business entity.
abstract interface class CSMEntityInterface implements CSMEncodableInterface {
  /// Entity database pointer.
  late int id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Client level evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<CSMEntityInvalidProperty> evaluate();
}
