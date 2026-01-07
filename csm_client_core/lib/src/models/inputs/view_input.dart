import 'package:csm_client_core/csm_client_core.dart';

/// {model} class for [ViewInput].
///
/// Defines a data model object that represents a {View} operation {input} object.
final class ViewInput<T extends IEntity<T>> implements IEncodable {
  /// Last created time, this works to limit the new entries on demand with [retroactive].
  DateTime? timestamp;

  /// Whether the {View} engine should consider records created after the [timestamp] last generated [ViewOutput].
  bool retroactive = false;

  /// Whether the {View} operation is for an exportable result context.
  bool export = false;

  /// Amount of items per [page].
  int range = 0;

  /// Specific page to get items.
  int page = 0;

  /// Filtering instructions for [EntityI] properties matching delegates. They are applied by the given [ViewFilterNodeI.order] property.
  List<IViewFilterNode<T>> filters = <IViewFilterNode<T>>[];

  /// Ordering instructions per [EntityI] property, they are applied by the collection order and are not override, meaning
  /// all orderings are applied at the same time.
  List<ViewOrdering> orderings = <ViewOrdering>[];

  /// Creates a new [ViewInput] instance.
  ViewInput();

  /// Creates a new [ViewInput] instance based on relevant properties.
  ViewInput.a(this.range, this.page, this.orderings, this.filters);

  /// Creates a new [ViewInput] instance based on specific paging properties.
  ViewInput.b(this.range, this.page);

  @override
  DataMap encode() {
    return <String, Object?>{
      EntityKeys.timestamp: timestamp,
      'retroactive': retroactive,
      'export': export,
      'range': range,
      'page': page,
      'filters': filters.encode(),
      'orderings': orderings.encode(),
    };
  }
}
