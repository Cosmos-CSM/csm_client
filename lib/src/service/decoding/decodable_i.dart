import 'package:csm_client/csm_client.dart';

/// {interface} for [DecodableI].
///
/// Defines contract for an [Object] able to be loaded from [DataMap] object.
abstract interface class DecodableI {
  /// Loads the current object content from the given [encode] object.
  /// 
  /// 
  /// [encode] object that contains encoded content.
  void decode(DataMap encode);
}
