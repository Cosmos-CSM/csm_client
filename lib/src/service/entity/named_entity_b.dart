import 'package:csm_client/csm_client.dart';

/// [abstract] class for [NamedEntityB].
///
///
/// [T] type of the [NamedEntityB] implementation.
///
/// Defines a base data / behavior implementation for [NamedEntityB] implementations, wich are [EntityB] implementations with the added properties of [name] and [description]
/// to handle specific business entities identification.
abstract class NamedEntityB<T extends EntityI<T>> extends EntityB<T> implements NamedEntityI<T> {
  /// [EntityI] unique name.
  @override
  String name = "";

  /// [EntityI] description.
  @override
  String? description;
}
