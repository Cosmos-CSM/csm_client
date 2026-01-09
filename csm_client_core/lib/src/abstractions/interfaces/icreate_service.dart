import 'package:csm_client_core/csm_client_core.dart';

/// Represents a [IService] with { Create } operations.
abstract interface class ICreateService<TEntity extends IEntity<TEntity>, TResponseResolver extends IResponseResolver<BatchOperationOutput<TEntity>>> implements IService {
  /// Creates a new instance.
  ICreateService();

  /// Creates a [TEntity] collection.
  ///
  ///
  /// [entities] records to create and store. ([TEntity.Id] property must be 0, [TEntity.Timestamp] always will be overriden to the exact moment is stored at the data storages).
  ///
  /// [auth] server authorization token.
  Future<TResponseResolver> create(List<TEntity> entities, String auth);
}
