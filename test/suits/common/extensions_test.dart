import 'package:csm_client/csm_client.dart';
import 'package:test/test.dart';

/// {entity} class.
///
/// Represents an entity class for testing purposes since test scope doesn't have access to external entities.
final class TestEntity extends EntityB<TestEntity> {
  /// Testing property value.
  String propValue = "";

  @override
  void decode(DataMap encode) {
    propValue = encode.get("propValue");
    super.decode(encode);
  }

  @override
  DataMap encode([DataMap? entityObject]) {
    return super.encode(
      <String, Object?>{
        "propValue": propValue,
      },
    );
  }

  @override
  List<EntityInvalidation<TestEntity>> evaluate() {
    return <EntityInvalidation<TestEntity>>[];
  }
}

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
      final BigInt bigIntObject = BigInt.from(10);
      final bool boolObject = true;

      final DataMap dataMapObject = <String, Object?>{
        'internal_dm': 'equality values',
      };
      final List<DataMap> dataMapListObject = <DataMap>[
        dataMapObject,
      ];

      final DateTime dateTimeObject = DateTime.now();
      final List<DateTime> dateTimeListObject = <DateTime>[dateTimeObject];

      final String stringObject = 'random_testing_string';

      final String testEntityPropValue = "some_random_value";
      final TestEntity testEntity = TestEntity();
      testEntity.propValue = testEntityPropValue;

      final DataMap dataMap = <String, Object?>{
        'no_key': null,
        'date_time': dateTimeObject.toString(),
        'date_time_list': <DateTime?>[null, ...dateTimeListObject],
        'date_time?': null,
        'date_time?_list': <DateTime?>[null, ...dateTimeListObject],
        'big_int': bigIntObject.toString(),
        'big_int?': null,
        'data_map_list': dataMapListObject,
        'data_map': dataMapObject,
        'data_map?': null,
        'string': stringObject,
        'string?': null,
        'bool': boolObject,
        'bool?': null,
        'int': intObject,
        'int?': null,
        'entity_null': null,
        'entity': testEntity.encode(),
      };

      group(
        '[get] method tests',
        () {
          test(
            '[get] throws unsupported type exception',
            () {
              expect(
                () => dataMap.get<Type>('no-key'),
                throwsException,
              );
            },
          );
          test(
            '[get] correctly gets [DateTime] / [DateTime?] values',
            () {
              final DateTime dateTimeValue = dataMap.get('date_time');
              expect(dateTimeObject, dateTimeValue);

              final DateTime? dateTimeNullValue = dataMap.get('date_time?');
              expect(null, dateTimeNullValue);
            },
          );
          test(
            '[get] correctly gets [String] / [String?] values',
            () {
              final String stringValue = dataMap.get('string');
              expect(stringObject, stringValue);

              final String? stringNullValue = dataMap.get('string?');
              expect(null, stringNullValue);
            },
          );

          test(
            '[get] correctly gets [int] / [int?] values',
            () {
              final int intValue = dataMap.get('int');
              expect(intObject, intValue);

              final int? intNullValue = dataMap.get('int?');
              expect(null, intNullValue);
            },
          );

          test(
            'get: correctly gets [BigInt] / [BigInt?] values',
            () {
              final BigInt bigIntValue = dataMap.get('big_int');
              expect(bigIntObject, bigIntValue);

              final BigInt? bigIntNullValue = dataMap.get('big_int?');
              expect(null, bigIntNullValue);
            },
          );

          /// [get] correctly gets [DataMap] / [DataMap?] values.
          test(
            'get: correctly gets [DataMap] / [DataMap?] values',
            () {
              final DataMap dataMapValue = dataMap.get('data_map');
              expect(dataMapObject, dataMapValue);

              final DataMap? dataMapNullValue = dataMap.get('data_map?');
              expect(null, dataMapNullValue);
            },
          );

          /// [get] correctly gets [bool] / [bool?] values.
          test(
            '[get] correctly gets [bool] / [bool?] values',
            () {
              final bool boolValue = dataMap.get('bool');
              expect(boolObject, boolValue);

              final bool? boolNullValue = dataMap.get('bool?');
              expect(boolNullValue, null);
            },
          );
        },
      );

      group(
        '[getList] method tests',
        () {
          test(
            '[get] throws unsupported type exception',
            () {
              expect(
                () => dataMap.getList<Type>('no_key'),
                throwsException,
              );
            },
          );
          test(
            '[get] correctly gets [DateTime] / [DateTime?] List values',
            () {
              final List<DateTime> dateTimeList = dataMap.getList('date_time_list');
              expect(dateTimeList, dateTimeListObject);

              final List<DateTime?> dateTimeNullList = dataMap.getList('date_time?_list');
              expect(dateTimeNullList, <DateTime?>[null, ...dateTimeListObject]);
            },
          );
        },
      );

      group(
        '[getEntity] method tests',
        () {
          test(
            '[getEntity] Correctly gets [EntityI] values',
            () {
              TestEntity? testEntityGot = dataMap.getEntity(
                () => TestEntity(),
                'entity_null',
              );
              expect(testEntityGot, null, reason: 'Got Entity must be null');

              TestEntity? testEntityGot2 = dataMap.getEntity(
                () => TestEntity(),
                'entity',
              );
              expect(testEntityGot2, isNotNull);
            },
          );
        },
      );
    },
  );
}
