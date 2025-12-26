import 'package:csm_client/csm_client.dart';

/// Type definition for a [DataMap] object.
typedef DataMap = Map<String, Object?>;

/// Type definition for a [DataMap] entry.
typedef DataMapEntry = MapEntry<String, Object?>;

/// Type definition for {HTTP} transaction [Headers].
typedef Headers = Map<String, String>;

/// Type definition for a [IService] builder.
typedef ServiceBuilder<T extends IService> = T Function(Uri serverUri, Client? serverClient);
