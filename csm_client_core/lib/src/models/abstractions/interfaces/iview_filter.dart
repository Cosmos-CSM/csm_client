import 'package:csm_client_core/csm_client_core.dart';

/// {interface} for [IViewFilter].
///
/// Defines a contract for [IViewFilter] implementations wich specifies a data filtering instruction
/// to the {View} operation for a certain {Set} of [T] type entities.
abstract interface class IViewFilter<T extends IEntity<T>> implements IEncodable {
  /// Unique operation time variation identification for transaction convertions.
  final String discriminator;

  /// Filtering application order when a collection of [IViewFilter] was given.
  final int order;

  /// Creates a new [IViewFilter] instance.
  const IViewFilter(this.discriminator, this.order);
}
