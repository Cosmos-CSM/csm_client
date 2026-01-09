import 'package:csm_client_core/csm_client_core.dart';

/// Represents an [IEntity] that is part of a catalog,
abstract interface class ICatalogEntity<TEntity extends IEntity<TEntity>> implements IEntity<TEntity>, INamedEntity<TEntity>, IVariation, IReferencedEntity<TEntity>, IActivableEntity<TEntity> {}
