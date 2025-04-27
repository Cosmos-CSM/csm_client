import 'dart:core' as core show Uri;
import 'dart:core' show String, int;

import 'package:csm_client/csm_client.dart' hide Uri;

/// [model] class for [Uri].
///
/// Defines contract storage that holds information about a communication address like http addresses, etc.
final class Uri {
  /// Communication protocol usage,
  final Protocols protocol;

  /// Host domain to connect with.
  final String domain;

  /// Path inside the [domain] that points the endpoint.
  final String path;

  /// Parameters to send to the endpoint through [url] query parsing.
  final DataMap? queryParams;

  /// Communication port to connect with.
  final int? port;

  /// Creates a new [Uri] instance.
  const Uri(
    this.domain,
    this.path, {
    this.port,
    this.queryParams,
    this.protocol = Protocols.https,
  });

  /// Creates a new [Uri] instance.
  ///
  ///
  /// [parent] the parent [Uri].
  ///
  /// [endpoint] the communication target endpoint.
  factory Uri.includeEndpoint(Uri parent, String endpoint) {
    return Uri(
      parent.domain,
      '${parent.path}/$endpoint',
      port: parent.port,
      queryParams: parent.queryParams,
      protocol: parent.protocol,
    );
  }

  /// Resolves the current [Uri] model data to an [core.Uri] object, for low level communication purposes.
  ///
  ///
  /// [endpoint] server request endpoint target.
  core.Uri resolve([String? endpoint]) {
    String builtEndpoint = path;
    if (endpoint != null) builtEndpoint += '/$endpoint';

    return core.Uri(
      scheme: protocol.scheme,
      host: domain,
      path: builtEndpoint,
      port: port,
      queryParameters: queryParams,
    );
  }
}
