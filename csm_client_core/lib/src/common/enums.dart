/// {enum} for [Protocols].
///
/// Holds the available types of [Protocols] supported for communications.
enum Protocols {
  https('https'),
  http('http'),
  curl('curl');

  /// Transaltion to a {core} implementations concept.
  final String scheme;

  /// Creates a new [Protocols] instance.
  const Protocols(this.scheme);
}
