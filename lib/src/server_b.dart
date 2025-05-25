import 'package:csm_client/csm_client.dart';
import 'package:csm_client/src/_is_prod_vm.dart' if (dart.library.js_interop) '_is_prod_web.dart';

import 'package:meta/meta.dart';



/// {abstract} class for [ServerB] implementations.
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

  /// {HTTP} global headers passed to all requested endpoints
  /// from this [ServerI] object.
  @override
  final Headers? serverHeaders;

  /// Custom {HTTP} communication handler client instance to be used by the [ServerI] implementation.
  ///
  /// Used only for testing/quality purposes, override it under full knowledgement.
  @override
  final Client? httpClient;

  /// Calculated final [ServerB] host location to communicate with.
  @protected
  late final Uri serverHost;

  /// Creates a new [ServerB] instance.
  ServerB(
    this.devHost, {
    this.prodHost,
    this.httpClient,
    this.serverHeaders,
  }) {
    bool isProd = isProduction;
    
    if (isProd && prodHost == null) {
      throw 'Runtime [Production] mode with no [Production] host server address configured';
    }

    serverHost = isProd ? prodHost! : devHost;
  }
}
