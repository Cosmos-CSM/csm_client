import 'package:csm_client/csm_client.dart';
import 'package:test/test.dart';

void main() {

  /// [int] extension tests.
  group(
    'IntExtension',
    () {
      /// [secs] method test.
      test(
        'secs: getter for int types, returns its value as a duration with the same value as seconds',
        () {
          Duration fact = 2.secs;

          expect(2, fact.inSeconds);
        },
      );

      /// [millisecs] method test
      test(
        'millisecs: getter for int types, returns its value as a duration with the same value as milliseconds',
        () {
          Duration fact = 2.millisecs;

          expect(2, fact.inMilliseconds);
        },
      );
    },
  );

  /// [DataMap] extension tests
  group(
    'DataMapExtension',
    () {
      final int intObject = 10;
      final bool boolObject = true;

      final DataMap dataMapObject = <String, Object?>{
        'internal_dm': 'equality values',
      };
      final List<DataMap> dataMapListObject = <DataMap>[
        dataMapObject,
      ];
      final DateTime dateTimeObject = DateTime.now();
      final String stringObject = 'random_testing_string';

      final DataMap dataMap = <String, Object?>{
        'date_time': dateTimeObject.toString(),
        'data_map_list': dataMapListObject,
        'data_map': dataMapObject,
        'string': stringObject,
        'bool': boolObject,
        'int': intObject,
      };

      /// [get] method tests.
      group(
        'get',
        () {
          /// [get] throws exception for unsupported types.
          test(
            'get: Throws unsupported type exception',
            () {
              expect(
                () => dataMap.get<Type>('no-key'),
                throwsException,
              );
            },
          );

          /// [get] correctly gets [DateTime] values.
          test(
            'get: correctly gets [DateTime] values',
            () {
              final DateTime fact = dataMap.get('date_time');
              expect(dateTimeObject, fact);
            },
          );

          /// [get] correctly gets [String] values.
          test(
            'get: correctly gets [String] values',
            () {
              final String fact = dataMap.get('string');
              expect(stringObject, fact);
            },
          );

          /// [get] correctly gets [int] values.
          test(
            'get: correctly gets [int] values',
            () {
              final int fact = dataMap.get('int');
              expect(intObject, fact);
            },
          );

          /// [get] correctly gets [DataMap] values.
          test(
            'get: correctly gets [DataMap] values',
            () {
              final DataMap fact = dataMap.get('data_map');
              expect(dataMapObject, fact);
            },
          );

          /// [get] correctly gets [List<DataMap>] values.
          test(
            'get: correctly gets [List<DataMap>] values',
            () {
              final List<DataMap> fact = dataMap.get('data_map_list');
              expect(dataMapListObject, fact);
            },
          );

          /// [get] correctly gets [bool] values.
          test(
            'get: correctly gets [bool] values',
            () {
              final bool fact = dataMap.get('bool');
              expect(boolObject, fact);
            },
          );
        },
      );
    },
  );
}
