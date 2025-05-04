import 'package:csm_client/csm_client.dart';

/// {interface} for [EncodableI].
///
/// Defines a contract for the implementation [Object] be converted to [DataMap] handlable object.
abstract interface class EncodableI {

  /// Converts the current [Object] into a [DataMap].
  DataMap encode();
}
