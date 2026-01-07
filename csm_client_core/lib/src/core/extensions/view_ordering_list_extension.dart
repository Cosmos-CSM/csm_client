import 'package:csm_client_core/csm_client_core.dart';

///
extension ViewOrderingListExtension on List<ViewOrdering> {
  ///
  List<DataMap> encode() {
    return map(
      (ViewOrdering el) => el.encode(),
    ).toList();
  }
}
