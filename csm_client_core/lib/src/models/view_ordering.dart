import 'package:csm_client_core/csm_client_core.dart';

/// {model} class for [ViewOrdering].
///
/// Deefines a data model object that represents an [EntityI] property ordering instruction to the
/// {View} generation engine.
final class ViewOrdering implements IEncodable {
  /// Name of the [EntityI] property to be ordered.
  String property = '';

  /// Ordering instruction.
  ViewOrderings ordering = ViewOrderings.ascending;

  /// Creates a new [ViewOrdering] instance.
  ViewOrdering();

  @override
  DataMap encode() {
    return <String, Object?>{
      'property': property,
      'ordering': ordering.index,
    };
  }
}

/// {enum} implementation for [ViewOrderings].
///
/// Stores the availbale ordering options for [ViewOrdering.ordering] property.
enum ViewOrderings {
  /// Whether the [ViewOrdering.property] must be ordered by ascending.
  ascending,

  /// Whether the [ViewOrdering.property] must be ordered by descending.
  descending,
}
