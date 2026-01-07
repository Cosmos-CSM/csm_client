import 'package:csm_client_core/csm_client_core.dart';

///
extension EntityCollection<T extends IEntity<T>> on List<T> {
  ///
  List<DataMap> encode() {
    return map((T el) => el.encode()).toList();
  }
}
