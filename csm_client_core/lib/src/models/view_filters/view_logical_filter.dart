import 'package:csm_client_core/csm_client_core.dart';

/// {implementation} class for [ViewFilterLogical].
///
///
/// [T] type of the [EntityI] implementation the filter will be applied to.
///
/// Defines an implementation from a [ViewFilterNodeI] that represents a data filtering instruction
/// for a logical operator based on a collection of filters.
final class ViewFilterLogical<T extends IEntity<T>> implements IViewFilterNode<T> {
  @override
  String discriminator = '';

  @override
  int order = 0;

  /// Collection of [ViewFilterI] to apply the calculation based on the [operator].
  List<IViewFilter<T>> filters = <IViewFilter<T>>[];

  /// Logical operator instruction to apply to this group of [filters].
  ViewFilterLogicalOperators operator = ViewFilterLogicalOperators.or;

  /// Creates a new [ViewFilterLogical] instance.
  ViewFilterLogical(this.order, this.operator, this.filters);

  @override
  DataMap encode() {
    List<DataMap> filtersData = filters
        .map(
          (IViewFilter<T> i) => i.encode(),
        )
        .toList();

    return <String, dynamic>{
      EntityKeys.discriminator: discriminator.toLowerCase(),
      'order': order,
      'operator': operator.index,
      'filters': filtersData,
    };
  }
}

/// {enum} implementation for [ViewFilterLogicalOperators].
///
/// Defines the available logical operators that can be used for [ViewFilterLogical.operator] property.
enum ViewFilterLogicalOperators {
  /// Whether the [ViewFilterLogical.filters] must be calculated with an [or] logical result calculation.
  or,

  /// Whether the [ViewFilterLogical.filters] must be calculated with an [and] logical result calculation.
  and,
}
