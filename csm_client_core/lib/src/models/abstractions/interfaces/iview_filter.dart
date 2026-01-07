

import 'package:csm_client_core/csm_client_core.dart';

/// {interface} for [IViewFilter].
///
///
/// [T] type of the [EntityI] implementation that the filter is based on.
///
/// Defines a contract for [IViewFilter] implementations that represents data filtering instructions
/// indicating the { View } generation how to build the result data.
abstract interface class IViewFilter<T extends IEntity<T>> implements IViewFilterNode<T> {
  /// Name of the [T] proeperty to be filtered.
  final String property;

  /// Creates a new [IViewFilter] instance.
  const IViewFilter(this.property);
}
