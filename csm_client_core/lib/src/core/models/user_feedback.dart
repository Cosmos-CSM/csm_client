import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_client_core/src/core/user_feedback_severities.dart';

/// Represents a server side error displayable feedback data.
final class UserFeedback implements DecodableI {
  /// Feedback message.
  String message = '';

  /// Feedback severity level.
  UserFeedbackSeverities severity = UserFeedbackSeverities.info;

  @override
  void decode(DataMap encode) {
    message = encode.get('message');

    final int severityInt = encode.get('severity');
    severity = UserFeedbackSeverities.values[severityInt];
  }
}
