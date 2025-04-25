import 'package:csm_client/csm_client.dart';
import 'package:meta/meta.dart';

/// [abstract] class for [ServerB] implementations.
///
/// Defines and handles base behavior for [ServerB] implementations like the server host address calculation based on the runtime mode,
/// etc.
abstract class ServerB implements ServerI {
  /// Host server address when the runtime is development.
  @override
  final Uri devHost;

  /// Host server when the runtime is production.
  @override
  final Uri? prodHost;

  /// [Http] global headers passed to all requested endpoints
  /// from this [ServerI] object.
  @override
  final Headers? serverHeaders;

  /// Custom [HTTP] communication handler client instance to be used by the [ServerI] implementation.
  ///
  /// Used only for testing/quality purposes, override it under full knowledgement.
  @override
  final Client? httpClient;

  /// Calculated final [ServerB] host location to communicate with.
  @protected
  late final Uri serverHost;

  /// Generates a [CSMRepository] behavior handler.
  ServerB(
    this.devHost, {
    this.prodHost,
    this.httpClient,
    this.serverHeaders,
  }) {
    bool isProd = bool.fromEnvironment('dart.vm.product');
    if (isProd && prodHost == null) {
      throw 'Runtime [Production] mode with no [Production] host server address configured';
    }

    serverHost = isProd ? prodHost! : devHost;
  }
}
