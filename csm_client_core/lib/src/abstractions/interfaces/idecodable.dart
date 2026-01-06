import 'package:csm_client_core/csm_client_core.dart';

/// Represents a decodable object.
abstract interface class IDecodable {
  /// Loads the current object content from the given [encode] object.
  ///
  ///
  /// [encode] object that contains encoded content.
  void decode(DataMap encode);
}
