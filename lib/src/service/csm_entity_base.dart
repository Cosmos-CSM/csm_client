import 'package:csm_client/csm_client.dart';

/// [Abstract]
abstract class CSMEntityBase implements CSMEntityInterface {
  @override
  int id = 0;

  @override
  DateTime timestamp = DateTime.now();

  @override
  JObject encode() {
    throw UnimplementedError();
  }
}
