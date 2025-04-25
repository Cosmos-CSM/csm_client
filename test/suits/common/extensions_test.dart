import 'package:csm_client/csm_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'DataMap Extension',
    () {
      final DateTime dateTimeObj = DateTime.now();

      final DataMap dataMap = <String, Object?>{
        'date_time': dateTimeObj.toString(),
      };

      test(
        'get<T>() correctly matches [DateTime] types',
        () {
          DateTime fact = dataMap.get('date_time');

          assert(dateTimeObj == fact);
        },
      );
    },
  );
}
