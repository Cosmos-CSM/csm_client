import 'package:csm_client_core/csm_client_core.dart';

/// Represents an encodable object.
abstract interface class IEncodable {
  /// Converts the current [Object] into a [DataMap].
  DataMap encode();
}
