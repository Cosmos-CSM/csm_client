import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_client_core/src/models/abstractions/interfaces/iview_filter.dart';

///
extension ViewFilterListExtension<T extends IEntity<T>> on List<IViewFilter<T>> {
  ///
  List<DataMap> encode() {
    return map(
      (IViewFilter<T> el) => el.encode(),
    ).toList();
  }
}
