import 'package:csm_client/csm_client.dart';

/// [Interface] for [Encodable] objects implementations, this interface provides members
/// to generate [encoded] objects based on an object content.
abstract interface class EncodableI {
  /// Converts the current [object] into and [encoded] object.
  JObject encode();
}
