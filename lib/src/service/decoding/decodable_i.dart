import 'package:csm_client/csm_client.dart';

/// [interface] for [Decodable] objects implementations, this interface provides
/// members to generate an [TObject] based on an [Encoded] content.
abstract interface class DecodableI {
  /// Unique specific object identification.
  late String discriminator;

  /// Loads the current object content from the given [encode] object.
  void decode(JObject encode);
}
