import 'package:csm_client_core/src/models/object_difference.dart';

/// Represents a comparable object that provides values differences between the object and the reference.
abstract interface class IComparableObject<TObject> {
  /// Compares the given [ref] with the current object values, considering the current one
  /// as the original values, and the given [ref] object values as the possible differences.
  ///
  /// [ref] - Object possible differences from this current original values [TObject].
  ///
  /// [aggregated] - Whether the abstraction levels need to pass differences calcultion to super methods.
  List<ObjectDifference> compare(TObject ref, [List<ObjectDifference>? aggregated]);
}
