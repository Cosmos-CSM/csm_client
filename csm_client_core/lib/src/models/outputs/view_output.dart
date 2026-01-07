import 'package:csm_client_core/csm_client_core.dart';

///
ViewOutput<T> viewOutputBuilder<T extends IEntity<T>>(T Function() entityBuilder) => ViewOutput<T>(entityBuilder);

/// {model} class for [ViewOutput].
///
/// Defines a data model class that represents an {output} object form the [FoundationServer] {view} operation along different
/// [EntityI] implementations.
///
///
/// [T] type of the [EntityI] implementation the {View} operation was called for.
final class ViewOutput<T extends IEntity<T>> implements IDecodable, IEncodable {
  /// The current calcualted page.
  int page = 0;

  /// Count of total available pages.
  int pages = 0;

  /// Indicates the quantity of records that this result contains.
  int length = 0;

  /// Count of total records that currently exist at the live database.
  int count = 0;

  /// Timemark when the result was created.
  DateTime timestamp = DateTime(0);

  /// {View} operation [T] collection result.
  List<T> entities = <T>[];

  /// Internal [T] builder for [decode] purposes.
  final T Function() _entityBuilder;

  /// Creates a new [ViewOutput] instance.
  ViewOutput(this._entityBuilder);

  @override
  void decode(DataMap encode) {
    page = encode.get('page');
    pages = encode.get('pages');
    length = encode.get('length');
    count = encode.get('count');
    timestamp = encode.get(EntityKeys.timestamp);

    final List<DataMap> rawEntities = encode.getList('entities');
    entities = rawEntities.map(
      (DataMap rawEntity) {
        final T entity = _entityBuilder();
        entity.decode(rawEntity);

        return entity;
      },
    ).toList();
  }

  @override
  DataMap encode() {
    return <String, Object?>{
      EntityKeys.timestamp: timestamp.toIso8601String(),
      'page': page,
      'pages': pages,
      'length': length,
      'count': count,
      'entities': entities.encode(),
    };
  }
}
