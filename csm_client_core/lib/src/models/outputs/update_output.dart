import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] based { Update } operation output result.
final class UpdateOutput<T extends IEntity<T>> implements IDecodable {
  /// The new updated [T] instance object.
  late T updated;

  /// The original [T] instance, before the update operation. This property depends on the operation parameters and if there
  /// was an original [T] instance before the update operation with the same [EntityI.id] value.
  T? original;

  /// [decode] purposes [T] builder.
  final T Function() _entityBuilder;

  /// Creates a new [UpdateOutput] instance.
  UpdateOutput(this._entityBuilder) {
    updated = _entityBuilder();
  }

  @override
  void decode(DataMap encode) {
    final DataMap updatedData = encode.get('updated');
    updated = _entityBuilder();
    updated.decode(updatedData);

    final DataMap? originalData = encode.get('original', null);
    original = originalData == null ? null : _entityBuilder();
    original?.decode(originalData ?? <String, Object?>{});
  }
}
