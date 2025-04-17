import 'package:csm_client/csm_client.dart';

/// [Interface] for [Encodable] objects implementations, this interface provides members
/// to generate [encoded] objects based on an object content.
abstract interface class CSMEncodable {
  /// Unique specific object identification.
  late String discriminator;

  /// Converts the current [object] into and [encoded] object.
  JObject encode();
}
