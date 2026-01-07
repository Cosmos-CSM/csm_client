import 'package:csm_client_core/csm_client_core.dart';

/// {implementation} class for [ViewPropertyFilter].
///
///
/// [T] type of the [EntityI] implementation the filter will be applied to.
///
/// Defines an implementaiton from [ViewFilterI], represents a data filtering instruction for the {View} operation calculation
/// based on a [T] specific property.
final class ViewPropertyFilter<T extends IEntity<T>> implements IViewFilter<T> {
  @override
  String discriminator = '';

  @override
  int order = 0;

  /// Name of the [T] proeperty to be filtered.
  @override
  String property = '';

  /// Reference filtering value.
  Object? value;

  /// Filtering operator.
  ViewFilterOperators operator = ViewFilterOperators.equal;

  /// Creates a new [ViewPropertyFilter] instance.
  ViewPropertyFilter();

  /// Creates a new [ViewPropertyFilter] instances with required properties for values filtering.
  ViewPropertyFilter.a({
    required this.property,
    this.operator = ViewFilterOperators.equal,
    this.value,
  });

  @override
  DataMap encode() {
    return <String, dynamic>{
      EntityKeys.discriminator: discriminator.toLowerCase(),
      'order': order,
      'property': property,
      'evaluation': operator.index,
      'value': value?.toString(),
      'operator': operator.index,
    };
  }
}

/// {enum} implementation for [ViewFilterOperators].
///
/// Defines the available operators that can be used for [ViewPropertyFilter.operator] property.
enum ViewFilterOperators {
  /// Whether the [EntityI] property must be equal the [ViewPropertyFilter.value].
  equal,

  /// Whether the [EntityI] property must contains the [ViewPropertyFilter.value].
  contains,

  /// Whether the [EntityI] property must be less than the [ViewPropertyFilter.value].
  lessThan,

  /// Whether the [EntityI] property must be equal or less than the [ViewPropertyFilter.value].
  lessThanEqual,

  /// Whether the [EntityI] property must be greater than the [ViewPropertyFilter.value].
  greaterThan,

  /// Whether the [EntityI] property must be equal or greater than the [ViewPropertyFilter.value].
  greaterThanEqual,
}
