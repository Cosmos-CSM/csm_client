import 'package:csm_client/csm_client.dart';

/// Represents a server communication handler.
abstract interface class IServer {
  /// Host server address when the runtime is development.
  final Uri devHost;

  /// Host server when the runtime is production.
  final Uri? prodHost;

  /// {HTTP} global headers passed to all requested endpoints
  /// from this [IServer] object.
  final Headers? serverHeaders;

  /// Custom {HTTP} communication handler client instance to be used by the [IServer] implementation.
  ///
  /// Used only for testing/quality purposes, override it under full knowledgement.
  final Client? httpClient;

  /// Creates a new instance.
  const IServer(
    this.devHost,
    this.prodHost,
    this.serverHeaders,
    this.httpClient,
  );
}
