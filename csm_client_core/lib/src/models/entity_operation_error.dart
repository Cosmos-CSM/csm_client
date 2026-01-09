import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] based operation error.
final class EntityOperationError<T extends IEntity<T>> implements IDecodable, IEncodable {
  /// Key binding for [entity] property..
  static const String kEntity = 'entity';

  /// Key binding for [message] property.
  static const String kMessage = 'message';

  /// Original instance that the operation was committed and failed..
  late T entity;

  /// Message caugth from the immediate exception that caused the operation failure.
  String message = '';

  /// Object factory for [T] types.
  final T Function() factory;

  /// Creates a new instance.
  EntityOperationError(this.factory);

  @override
  void decode(DataMap encode) {
    message = encode.get(kMessage);

    entity = factory();
    entity.decode(encode.get(kEntity));
  }

  @override
  DataMap encode() {
    return <String, Object?>{
      kEntity: entity.encode(),
      kMessage: message,
    };
  }
}
