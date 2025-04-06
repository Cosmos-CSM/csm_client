import 'package:csm_client/csm_client.dart';

/// [Interface] definition for a [server] implementation, the server is a network end-point from where the services will be provided.
abstract interface class CSMServerInterface {
  /// The host server location.
  final CSMUri host;

  /// Host when the runtime in on development.
  final CSMUri development;

  /// Host when the runtime is on production.
  final CSMUri? production;

  /// Custom communication client to use.
  ///
  /// Used only for testing/quality purposes, override under full consideration.
  final Client? client;

  /// Creates a new [CSMServerInterface] instance.
  const CSMServerInterface(this.host, this.development, this.production, this.client);
}
