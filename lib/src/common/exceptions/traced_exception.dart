/// [exception] class for [TracedException].
///
/// Defines an exception with [StackTrace] information about where was thrown.
final class TracedException implements Exception {
  /// Exception data object.
  final Object data;

  /// Exception stack tracing information.
  final StackTrace stackTrace;

  /// Creates a new [TracedException] instance.
  const TracedException(this.data, this.stackTrace);

  @override
  String toString() {
    return data.toString();
  }
}
