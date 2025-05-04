/// [exception] class for [TracedException].
///
/// Defines an exception with [StackTrace] information about where was thrown.
final class TracedException implements Exception {
  /// Exception data object.
  final Object data;

  /// Exception stack tracing information.
  late StackTrace stackTrace;

  /// Creates a new [TracedException] instance.
  TracedException(this.data, [StackTrace? stackTrace]) {
    stackTrace = StackTrace.current;
  }
}
