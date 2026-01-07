import 'package:csm_client_core/csm_client_core.dart';

/// {implementation} class for [ViewFilterDate].
///
/// Defines a final behavior implementation from [ViewFilterI], that represents a data filtering for the {View} operation
/// based on a [DateTime] threshold.
///
///
/// [T] type of the [EntityI] impolementation the filter will be applied to.
///
final class ViewFilterDate<T extends IEntity<T>> implements IViewFilter<T> {
  @override
  String discriminator = '';

  @override
  String property = EntityKeys.timestamp;

  @override
  int order = 0;

  /// Initial [DateTime] threshold.
  DateTime from = DateTime.now().toUtc();

  /// Final [DateTime] threshold.
  DateTime? to;

  /// Creates a new [ViewFilterDate] instance.
  ViewFilterDate();

  /// Creates a new [ViewFilterDate] instances with main properties for values filtering.
  ViewFilterDate.a({
    required this.property,
    required this.from,
    required this.to,
  });

  @override
  DataMap encode() {
    return <String, dynamic>{
      EntityKeys.discriminator: discriminator.toLowerCase(),
      'property': property,
      'order': order,
      'from': from.toIso8601String(),
      'to': to?.toIso8601String(),
    };
  }
}
