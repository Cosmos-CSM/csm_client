import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] batched operation for multiple results.
final class BatchOperationOutput<TEntity extends IEntity<TEntity>> implements IDecodable {
  /// Collection of batch operation successes.
  List<TEntity> successes = <TEntity>[];

  /// Collection of batch operation failures.
  List<EntityOperationError<TEntity>> failures = <EntityOperationError<TEntity>>[];

  /// Whether at least one operation iteration has failed.
  bool failed = false;

  /// Wheter all operations have failed.
  bool fullFailed = false;

  /// The total amount of operations executed.
  int operationsCount = 0;

  /// The total amount of failed operations.
  int failuresCount = 0;

  /// The total amount of successful operations.
  int successesCount = 0;

  /// Internal [TEntity] factory for construction.
  final TEntity Function() _factory;

  /// Creates a new [BatchOperationOutput] instance.
  BatchOperationOutput(this._factory);

  @override
  void decode(DataMap encode) {
    failed = encode.get('failed');
    fullFailed = encode.get('fullFailed');
    operationsCount = encode.get('operationsCount');
    failuresCount = encode.get('failuresCount');
    successesCount = encode.get('successesCount');

    final List<DataMap> successesDataMap = encode.getList('successes');
    successes = successesDataMap.map(
      (Map<String, Object?> e) {
        final TEntity entity = _factory();
        entity.decode(e);
        return entity;
      },
    ).toList();

    final List<DataMap> failuresDataMap = encode.getList('failures');
    failures = failuresDataMap.map(
      (Map<String, Object?> e) {
        final EntityOperationError<TEntity> entityOperationFailure = EntityOperationError<TEntity>(_factory);
        entityOperationFailure.decode(e);
        return entityOperationFailure;
      },
    ).toList();
  }
}
