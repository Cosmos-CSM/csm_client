import 'package:csm_client_core/csm_client_core.dart';

/// {interface} for [IViewFilterNode].
///
/// Defines a contract for [IViewFilterNode] implementations wich specifies a data filtering instruction
/// to the {View} operation for a certain {Set} of [T] type entities.
abstract interface class IViewFilterNode<T extends IEntity<T>> implements IEncodable {
  /// Unique operation time variation identification for transaction convertions.
  final String discriminator;

  /// Filtering application order when a collection of [IViewFilterNode] was given.
  final int order;

  /// Creates a new [IViewFilterNode] instance.
  const IViewFilterNode(this.discriminator, this.order);
}
