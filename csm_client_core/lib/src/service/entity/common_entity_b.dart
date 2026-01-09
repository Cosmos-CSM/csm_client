import 'package:csm_client_core/csm_client_core.dart';
import 'package:meta/meta.dart';

/// Represents an [EntityI] that holds a scope between internal ( tenant business entities data ) and external ( tenant partners entities data ).
///
/// [TEntity] type of the [EntityI] implementation.ArgumentError
///
/// [TInternal] Type of the [EntityI] that represents the internal data model.
///
/// [TExternal] type of the [EntityI] that represents the external data model.
abstract interface class CommonEntityI<TEntity extends IEntity<TEntity>, TInternal extends IEntity<TInternal>, TExternal extends IEntity<TExternal>> implements IEntity<TEntity> {
  /// [TInternal] data.
  final TInternal? internal;

  /// [TExternal] data.
  final TExternal? external;

  /// Creates a new instance.
  const CommonEntityI(this.internal, this.external);
}

/// Represents an [EntityI] that holds a scope between internal ( tenant business entities data ) and external ( tenant partners entities data ).
///
/// [TEntity] type of the [EntityI] implementation.ArgumentError
///
/// [TInternal] Type of the [EntityI] that represents the internal data model.
///
/// [TExternal] type of the [EntityI] that represents the external data model.
abstract class CommonEntityB<TEntity extends IEntity<TEntity>, TInternal extends IEntity<TInternal>, TExternal extends IEntity<TExternal>> extends EntityBase<TEntity>
    implements CommonEntityI<TEntity, TInternal, TExternal> {
  /// [TInternal] data.
  @override
  TInternal? internal;

  /// [TExternal] data.
  @override
  TExternal? external;

  /// Creates a new [TInternal] instance.
  @protected
  TInternal internalFactory();

  /// Creates a new [TExternal] instance.
  @protected
  TExternal externalFactory();

  /// Encodes the current [T] object into a [DataMap] object.
  ///
  ///
  /// [entityObject] acumulative delegated [DataMap] convertion along the different bases implementations.
  ///
  /// When implemented from [CommonEntityB], is not needed to encode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [internal]
  /// - [external]
  ///
  /// They are being auto encoded from the [CommonEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  DataMap encode([DataMap? entityObject]) {
    DataMap encode = <String, Object?>{
      CorePropertiesConsts.internal: internal?.encode(),
      CorePropertiesConsts.external: external?.encode(),
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
  /// When implemented from [CommonEntityB], is not needed to decode the following properties:
  ///
  /// - [id]
  /// - [timestamp]
  /// - [discriminator]
  /// - [internal]
  /// - [external]
  ///
  /// They are being auto decoded from the [CommonEntityB] base behavior.
  @override
  @mustCallSuper
  @mustBeOverridden
  void decode(DataMap encode) {
    super.decode(encode);
    internal = encode.getEntity(internalFactory, CorePropertiesConsts.internal);
    external = encode.getEntity(externalFactory, CorePropertiesConsts.external);
  }
}
