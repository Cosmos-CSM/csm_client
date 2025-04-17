import 'package:csm_client/csm_client.dart';

/// [interface] definition for [encodable] implementations, this means usually, that the object needs to be [encoded] for
/// system communications through network or protocols.
abstract interface class CSMEncodableInterface {
  /// Unique specific object identification.
  late String discriminator;

  /// Converts the current [object] into and [encoded] object.
  JObject encode();
}
