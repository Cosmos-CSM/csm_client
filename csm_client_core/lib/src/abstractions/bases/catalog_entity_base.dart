import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_client_core/src/abstractions/interfaces/icatalog_entity.dart';
import 'package:meta/meta.dart';

/// Represents an [IEntity] that is part of a catalog,
abstract class CatalogEntityBase<TEntity extends IEntity<TEntity>> extends NamedEntityBase<TEntity> implements ICatalogEntity<TEntity> {
  /// Unique reference value.
  ///
  /// It's lenght must be strict 8.
  @override
  String reference = "";

  /// Indicates whether the entity is active or not.
  @override
  bool isEnabled = false;

  /// Creates a new instance.
  CatalogEntityBase();

  @override
  @mustCallSuper
  DataMap encode([DataMap? entityObject]) {
    return super.encode(
      <String, Object?>{
        CorePropertiesConsts.reference: reference,
        CorePropertiesConsts.isEnabled: isEnabled,
      },
    );
  }

  @override
  @mustCallSuper
  void decode(DataMap encode) {
    reference = encode.get(CorePropertiesConsts.reference);
    isEnabled = encode.get(CorePropertiesConsts.isEnabled);

    super.decode(encode);
  }
}
