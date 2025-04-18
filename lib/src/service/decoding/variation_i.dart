/// [Interface] for [Variable] encodable objects, usually used when the operations are resquesting interfaces and there could be a collection of possible variations
/// this interface determines the implementations is a [Variation].
abstract interface class VariationI {
  /// Unique specific object identification.
  late String discriminator;
}
