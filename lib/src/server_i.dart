import 'package:csm_client/csm_client.dart';

/// {interface} for [ServerI] implementations.
///
///
/// Defines a contract for [ServerI] implementations that represents a host server
/// communication object.
abstract interface class ServerI {
  /// Host server address when the runtime is development.
  final Uri devHost;

  /// Host server when the runtime is production.
  final Uri? prodHost;

  /// {HTTP} global headers passed to all requested endpoints
  /// from this [ServerI] object.
  final Headers? serverHeaders;

  /// Custom {HTTP} communication handler client instance to be used by the [ServerI] implementation.
  ///
  /// Used only for testing/quality purposes, override it under full knowledgement.
  final Client? httpClient;

  /// Creates a new [ServerI] instance.
  const ServerI(this.devHost, this.prodHost, this.serverHeaders, this.httpClient);
}
