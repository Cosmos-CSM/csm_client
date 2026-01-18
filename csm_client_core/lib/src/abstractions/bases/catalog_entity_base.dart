import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_client_core/src/abstractions/interfaces/icatalog_entity.dart';
import 'package:meta/meta.dart';

/// Represents an [IEntity] that is part of a catalog,
abstract class CatalogEntityBase<TEntity extends ICatalogEntity<TEntity>> extends NamedEntityBase<TEntity> implements ICatalogEntity<TEntity> {
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

  @override
  List<ObjectDifference> compare(TEntity ref, [List<ObjectDifference> aggregated = const <ObjectDifference>[]]) {
    if (isEnabled != ref.isEnabled) {
      aggregated.add(
        ObjectDifference(
          PropertyInfo('isEnabled', bool, isEnabled),
          isEnabled,
          ref.isEnabled,
          null,
        ),
      );
    }

    return super.compare(ref, aggregated);
  }
}
