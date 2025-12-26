import 'package:csm_client/csm_client.dart';

import 'package:meta/meta.dart';

/// Represents a server communication handler.
abstract class ServerBase implements IServer {
  /// Host server address when the runtime is development.
  @override
  final Uri devHost;

  /// Host server when the runtime is production.
  @override
  final Uri? prodHost;

  /// {HTTP} global headers passed to all requested endpoints
  /// from this [IServer] object.
  @override
  final Headers? serverHeaders;

  /// Custom {HTTP} communication handler client instance to be used by the [IServer] implementation.
  ///
  /// Used only for testing/quality purposes, override it under full knowledgement.
  @override
  final Client? httpClient;

  /// Calculated final [ServerBase] host location to communicate with.
  @protected
  late final Uri serverHost;

  /// Creates a new instance.
  ServerBase(
    this.devHost, {
    this.prodHost,
    this.httpClient,
    this.serverHeaders,
    required bool isRelease,
  }) {
    if (isRelease && prodHost == null) {
      throw 'Runtime [Production] mode with no [Production] host server address configured';
    }

    serverHost = isRelease ? prodHost! : devHost;
  }
}
