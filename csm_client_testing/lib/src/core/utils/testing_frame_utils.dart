import 'package:csm_client_core/csm_client_core.dart';

/// Handle utilities methods for { CSM } framework server communication frames handling.
final class TestingFrameUtils {
  /// Builds a generic {CSM} server frame [DataMap].
  ///
  /// [content] - frame object content.
  static DataMap buildGenericFrame(DataMap content) {
    return <String, Object?>{
      'id': 'test_tracer',
      'content': content,
    };
  }
}
