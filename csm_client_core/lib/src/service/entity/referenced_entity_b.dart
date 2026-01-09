import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents an [EntityI] with a [reference] unique property wich allows its identification along
/// data storages migrations as this property is absolute static.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract interface class ReferencedEntityI<TEntity extends IEntity<TEntity>> implements IEntity<TEntity> {
  /// Unique reference value.
  ///
  /// It's lenght must be strict 8.
  final String reference;

  /// Creates a new instance.
  const ReferencedEntityI(this.reference);
}

/// Represents an [EntityI] with a [reference] unique property wich allows its identification along
/// data storages migrations as this property is absolute static.
///
///
/// [TEntity] type of the [EntityI] implementation.
abstract class ReferencedEntityB<T extends IEntity<T>> extends EntityBase<T> implements ReferencedEntityI<T> {
  /// Unique reference value.
  ///
  /// It's lenght must be strict 8.
  @override
  String reference = "";

  /// Encodes the current [T] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [ReferencedEntityB], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [reference]
  ///
  /// They are being auto encoded from the [ReferencedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
      CorePropertiesConsts.reference: reference,
    };

    if (entityObject != null) {
      encode.addEntries(entityObject.entries);
    }

    return super.encode(encode);
  }

  /// Decodes the given [DataMap] into the current [T] object, loading the properties bound in the [DataMap].
  ///
  ///
  /// [encode] object storing properties values to load the current [T] instance object.
  ///
  /// When implemented from [ReferencedEntityB], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [reference]
  ///
  /// They are being auto decoded from the [ReferencedEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    super.decode(encode);
    reference = encode.get(CorePropertiesConsts.reference);
  }
}
