import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IComparableObject] property value difference.
final class ObjectDifference {
  /// Object property difference.
  final PropertyInfo property;

  /// Difference original value.
  final Object? originalValue;

  /// Difference updated value.
  final Object? differenceValue;

  /// Whether the current property is an inner [IComparableObject] and starts a new sub-tree.
  final List<ObjectDifference>? innerDifferences;

  /// Creates a new instance.
  const ObjectDifference(
    this.property,
    this.originalValue,
    this.differenceValue,
    this.innerDifferences,
  ) : assert(
          // If it's a leaf: both values must be provided and no innerDifferences
          (originalValue != null && differenceValue != null && innerDifferences == null) ||

              // If it's a branch: innerDifferences must be provided and both values must be null
              (innerDifferences != null && originalValue == null && differenceValue == null),

          'Provide EITHER (originalValue + differenceValue) OR innerDifferences, but not both.',
        );
}
