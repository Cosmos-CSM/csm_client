import 'package:csm_client/csm_client.dart';

/// [interface] for [Decodable] objects implementations, this interface provides
/// members to generate an [TObject] based on an [Encoded] content.
abstract interface class CSMDecodable<TObject> {
  /// Unique specific object identification.
  late String discriminator;

  /// Converts the current [object] into and [encoded] object.
  TObject decode(JObject encode);
}
