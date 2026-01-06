import 'package:csm_client_core/csm_client_core.dart';

/// Represents public tradeable internal errors information for public error exposure.
final class ErrorInfo implements IDecodable {
  /// Error message.
  String message = '';

  /// Error advise message.
  String advise = '';

  /// Error event trigger.
  int event = 0;

  /// A system reflected type with message from the exception thrown at server context.
  String systemError = '';

  /// Error user feedback.
  List<UserFeedback> feedback = <UserFeedback>[];

  /// A custom collection of data, this is custom per exception definition.
  DataMap data = <String, Object?>{};

  /// Generates a new [ErrorInfo] object.
  ErrorInfo();

  @override
  void decode(DataMap encode) {
    event = encode.get('event');
    advise = encode.get('advise');
    systemError = encode.get('systemError');
    data = encode.get('data');

    final List<DataMap> feedbackDataMap = encode.getList('feedback');
    feedback = feedbackDataMap.map(
      (Map<String, Object?> feedbackDataMapItem) {
        final UserFeedback feedbackItem = UserFeedback();
        feedbackItem.decode(feedbackDataMapItem);
        return feedbackItem;
      },
    ).toList();
  }
}
