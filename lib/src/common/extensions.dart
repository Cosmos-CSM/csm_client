import 'dart:typed_data' show Uint8List;

import 'package:csm_client/csm_client.dart' show DataMap, DataMapEntry;

/// [extension] for [int] type.
///
/// Adds custom extension methods to simplfy conversions and calculations with [int] type objects.
extension IntExtension on int {
  /// Gets the [int] value as a [Duration] object in [seconds].
  Duration get secs => Duration(
        seconds: this,
      );

  /// Gets the [int] value as a [Duration] object in [milliseconds].
  Duration get millisecs => Duration(
        milliseconds: this,
      );
}

/// [extension] for [DataMap] type.
///
/// Adds custom extension methods to simplify conversions and calculations with [DataMap] type objects.
extension DataMapExtension on DataMap {
  /// Stores the current supported [Type]'s to auto cast and run specific sanitization.
  static const List<Type> _supported = <Type>[
    String,
    int,
    DateTime,
    bool,
    DataMap,
    List<DataMap>,
  ];

  /// Gets the value of the first [keyFallbacks] key found at the [DataMap] matched.
  ///
  ///
  /// [keyFallbacks] the available keys to be evaluated with the current [DataMap] keys to get its value.
  ///
  /// [caseSensitive] indicates if the keys match must be case sensitive.
  Object? _getValue(List<String> fallbacks, [bool caseSensitive = false]) {
    for (DataMapEntry dataEntry in entries) {
      final String currKey = dataEntry.key;
      final bool isIn = fallbacks.any(
        (String keyFallback) {
          if (caseSensitive) {
            return keyFallback == currKey;
          }

          return ((currKey.toLowerCase()) == (keyFallback.toLowerCase()));
        },
      );

      if (isIn) return dataEntry.value;
    }

    return null;
  }

  /// Gets the value of the first [keyFallbacks] key found at the [DataMap] matched, and casts it as the given expected type.
  ///
  ///
  /// [TExpected] expected type for the value.
  ///
  /// [keyFallbacks] the available keys to be evaluated with the current [DataMap] keys to get its value.
  ///
  /// [defaultValue] when the iteration fails returns this value.
  ///
  /// [caseSensitive] indicates if the keys match must be case sensitive.
  TExpected _getCastValue<TExpected>(List<String> keyFallbacks, TExpected defaultValue, [bool caseSensitive = false]) {
    TExpected? gottenValue;
    dynamic valueFound = _getValue(keyFallbacks, caseSensitive);
    gottenValue = (valueFound as TExpected?);

    return gottenValue ?? defaultValue;
  }

  /// Specified sanitization procedures for [DateTime] supported [Type].
  /// This is used by [get] implementations and is permorfed when the requested
  /// value type is [DateTime].
  ///
  /// [key] Specified [DataMap] key to trace and bind the property value.
  ///
  /// [caseSensitive] Specifies if the key searching in the object should consider the specific casing of the words.
  DateTime _getDateTime(String key, [DateTime? defaultValue, bool caseSensitive = false]) {
    String stringValue = _getCastValue(<String>[key], '', caseSensitive);

    if (stringValue.isEmpty) {
      return defaultValue ?? DateTime(0);
    }

    return DateTime.parse(stringValue);
  }

  /// Specified sanitization procedures for [int] supported [Type].
  /// This is used by [get] implementations and is permorfed when the requested
  /// value is a [int].
  ///
  ///
  /// [key] Specified [DataMap] key to trace and bind the property value.
  ///
  /// [defaultValue] if the resolved value is not found or null will return the given [defaultValue]
  ///
  /// [caseSensitive] Specifies if the key searching in the object should consider the specific casing of the words.
  int _getInt(String key, [int? defaultValue, bool caseSensitive = false]) {
    int? value = _getCastValue(<String>[key], null, caseSensitive);
    if (value == null) {
      if (defaultValue != null) {
        return defaultValue;
      }
      throw 'InvalidType: Unable to convert ${value.runtimeType} into expected $int';
    }
    return value;
  }

  /// Specified sanitization procedures for [List] of [DataMap] supported [Type].
  /// This is used by [get] implementations and is permorfed when the requested
  /// value is a [List] of [DataMap].
  ///
  ///
  /// [key] Specified [DataMap] key to trace and bind the property value.
  ///
  /// [caseSensitive] Specifies if the key searching in the object should consider the specific casing of the words.
  List<DataMap> _getDataMapList(String key, [List<DataMap>? defaultListValue, bool caseSensitive = false]) {
    List<dynamic> bindedList = _getCastValue(<String>[key], defaultListValue ?? <DataMap>[], caseSensitive);
    List<DataMap> castList = bindedList.cast<DataMap>();

    return castList;
  }

  /// Gets the value of the given key from the [DataMap].
  ///
  ///
  /// [T] type expected for the value.
  ///
  /// [key] value key at the [DataMap].
  ///
  /// [caseSensitive] Specifies if the key searching in the object should consider the specific casing of the words.
  T get<T>(String key, [T? defaultValue, bool caseSensitive = false]) {
    if (!_supported.contains(T)) {
      throw Exception('Unsupported: This method doesn\'t allow binding for $T');
    }

    if (T == DateTime) return _getDateTime(key, defaultValue as DateTime?, caseSensitive) as T;
    if (T == String) return _getCastValue<T>(<String>[key], defaultValue ?? '' as T, caseSensitive);
    if (T == int) return _getInt(key, defaultValue as int?, caseSensitive) as T;
    if (T == DataMap) return _getCastValue(<String>[key], defaultValue ?? <String, Object?>{} as T, caseSensitive);
    if (T == List<DataMap>) return _getDataMapList(key, defaultValue as List<DataMap>?, caseSensitive) as T;
    if (T == bool) return _getCastValue(<String>[key], defaultValue ?? false as T, caseSensitive);

    throw Exception('CriticalException: Couldn\'t found $T convertion implementation and broke up validations');
  }

  /// Gets the list value of the given key from the [DataMap].
  ///
  ///
  /// [key] Specified [DataMap] key to trace and bind the property value.
  ///
  /// [caseSensitive] wheter the key matching must consider word casing.
  List<T> getList<T>(String key, [bool caseSensitive = false]) {
    List<T> cacheList = <T>[];

    Object? rawList = _getValue(<String>[key], caseSensitive);
    try {
      cacheList = (rawList as List<T>);
      return cacheList;
    } catch (x) {
      List<Object?> castObjectList = rawList as List<Object?>;
      for (Object? value in castObjectList) {
        try {
          T valueAsExpect = value as T;
          cacheList.add(valueAsExpect);
        } catch (x) {
          continue;
        }
      }
      return cacheList;
    }
  }

  /// Gets the value of the first matched key from the given [keysFallback].
  ///
  /// [T] type expected for the found value.
  ///
  /// [key] Specified [DataMap] key to trace and bind the property value.
  ///
  /// [defaultValue] Default value to return when the bind fails.
  ///
  /// [caseSensitive] wheter the key matching must consider word casing.
  T fallbackGet<T>(List<String> keysFallback, T defaultValue, [bool caseSensitive = false]) {
    return _getCastValue(keysFallback, defaultValue);
  }
}

/// [extension] for [String] type.
///
/// Adds custom extension methods to simplify conversions and calculations with [String] type objects.
extension StringExtension on String {
  /// Returns whether the current [String] starts with uppercase.
  bool get isStartUpper {
    final String startLetter = substring(0, 1);
    return startLetter.toUpperCase() == startLetter;
  }

  /// Converts the current [String] into a new [String] object that starts with uppercase.
  String get toStartUpper {
    if (isStartUpper) return this;
    final String startLetter = substring(0, 1);
    return '${startLetter.toUpperCase()}${substring(1, length)}';
  }

  /// Converts the current [String] into a [Uint8List] using base64 convertion.
  Uint8List get bytes {
    return Uint8List.fromList(codeUnits);
  }
}
