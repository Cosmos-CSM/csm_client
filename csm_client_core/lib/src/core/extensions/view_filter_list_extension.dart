import 'package:csm_client_core/csm_client_core.dart';

///
extension ViewFilterListExtension<T extends IEntity<T>> on List<IViewFilterNode<T>> {
  ///
  List<DataMap> encode() {
    return map(
      (IViewFilterNode<T> el) => el.encode(),
    ).toList();
  }
}
