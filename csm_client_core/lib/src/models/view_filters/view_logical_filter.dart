import 'package:csm_client_core/csm_client_core.dart';

/// {implementation} class for [ViewLogicalFilter].
///
///
/// [TEntity] type of the [EntityI] implementation the filter will be applied to.
///
/// Defines an implementation from a [ViewFilterNodeI] that represents a data filtering instruction
/// for a logical operator based on a collection of filters.
final class ViewLogicalFilter<TEntity extends IEntity<TEntity>> implements IViewFilterNode<TEntity> {
  @override
  String discriminator = '';

  @override
  int order = 0;

  /// Collection of [ViewFilterI] to apply the calculation based on the [operator].
  List<IViewFilter<TEntity>> filters = <IViewFilter<TEntity>>[];

  /// Logical operator instruction to apply to this group of [filters].
  ViewFilterLogicalOperators operator = ViewFilterLogicalOperators.or;

  /// Creates a new [ViewLogicalFilter] instance.
  ViewLogicalFilter(this.order, this.operator, this.filters);

  @override
  DataMap encode() {
    List<DataMap> filtersData = filters
        .map(
          (IViewFilter<TEntity> i) => i.encode(),
        )
        .toList();

    return <String, dynamic>{
      CorePropertiesConsts.discriminator: discriminator.toLowerCase(),
      'order': order,
      'operator': operator.index,
      'filters': filtersData,
    };
  }
}

/// {enum} implementation for [ViewFilterLogicalOperators].
///
/// Defines the available logical operators that can be used for [ViewLogicalFilter.operator] property.
enum ViewFilterLogicalOperators {
  /// Whether the [ViewLogicalFilter.filters] must be calculated with an [or] logical result calculation.
  or,

  /// Whether the [ViewLogicalFilter.filters] must be calculated with an [and] logical result calculation.
  and,
}
