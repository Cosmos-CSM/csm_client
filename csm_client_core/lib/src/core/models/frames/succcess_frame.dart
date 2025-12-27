import 'package:csm_client_core/csm_client_core.dart';

/// Data {class} implementation for an [FailureFrame].
///
///
/// [T] type of the response body data object.
///
/// Defines a data constract for a frame that represents a [ServerI] implementation successfuly response with interest data.
final class SuccessFrame<T extends DecodableI?> implements DecodableI {
  /// Unique operation identifier.
  String id = '';

  /// Response data object.
  late T content;

  /// Internal [T] builder for [DecodableI] purposes.
  final T Function() _estelaBuilder;

  /// Creates a new [SuccessFrame] instance.
  SuccessFrame(this._estelaBuilder) {
    content = _estelaBuilder();
  }

  /// Creates a new [SuccessFrame] instance with directly [content] given.
  SuccessFrame.a(this._estelaBuilder, this.content);

  @override
  void decode(DataMap encode) {
    id = encode.get('id');

    if (null is! T) {
      final DataMap estelaData = encode.get('content');
      content = _estelaBuilder();
      content!.decode(estelaData);
      return;
    }

    final DataMap? estelaData = encode.get('content');
    if (estelaData == null) {
      content = null as T;
      return;
    }

    content = _estelaBuilder();
    content!.decode(estelaData);
  }
}
