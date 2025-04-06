import 'package:csm_client/csm_client.dart';

abstract class CSMEntityBase implements CSMEntityInterface {
  @override
  int id = 0;

  @override
  DateTime timestamp = DateTime.now();
}
