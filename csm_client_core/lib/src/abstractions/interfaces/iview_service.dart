import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_client_core/src/models/inputs/view_input.dart';
import 'package:csm_client_core/src/models/outputs/view_output.dart';

/// Represents a { View } operations provider service.
abstract interface class IViewService<TEntity extends IEntity<TEntity>, TResponseResolver extends IResponseResolver<ViewOutput<TEntity>>> {
  /// Creates a new [IViewService] instance.
  const IViewService();

  /// Generates a {view} complex object from [TEntity] entity.
  ///
  ///
  /// [options] how the method will build the {View} result, are instructions for the paging, ordering, etc.
  ///
  /// [auth] server authorization token.
  TResponseResolver view(ViewInput<TEntity> input, String auth);
}
