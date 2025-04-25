/// [model] class for [PropertyInfo].
///
/// Defines storage contract for data related with the a class property information.
final class PropertyInfo {
  /// Property name.
  final String name;

  /// Property runtime type.
  final Type type;

  /// Property value.
  final Object? value;

  const PropertyInfo(this.name, this.type, this.value);
}
