import 'package:csm_client/csm_client.dart';

/// [interface] for [EntityI].
///
///
/// [T] type of the [EntityI] implementation.
///
/// Defines a data and behavior contract for an [EntityI] implementation, wich represents a business object from the customer.
abstract interface class EntityI<T extends EntityI<T>> implements EncodableI, DecodableI, VariationI {
  /// Entity database pointer.
  late BigInt id;

  /// Entity handling timestamp.
  late DateTime timestamp;

  /// Creates a new [EntityI] instance with default values.
  EntityI();

  /// Client level evaluation for this set record to check if can be written correctly by the service.
  ///
  /// If the result list came empty, means no validation results were thrown (meaning the evaluation is correct).
  List<EntityInvalidation<T>> evaluate();
}
