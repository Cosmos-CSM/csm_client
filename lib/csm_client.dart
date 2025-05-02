/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: directives_ordering
library;

export 'package:http/http.dart' show Client;
export 'package:http/testing.dart' show MockClient, MockClientHandler, MockClientStreamHandler;

// --> Exporting [src] 
export 'src/server_i.dart';
export 'src/server_b.dart';

// --> Exporting [common]
export 'src/common/enums.dart';
export 'src/common/typedefs.dart';
export 'src/common/extensions.dart';
export 'src/common/constants.dart';

// --> Exporting [common.exceptions]
export 'src/common/exceptions/traced_exception.dart';

// --> Exporting [models]
export 'src/models/uri.dart';
export 'src/models/property_info.dart';
export 'src/models/entity_invalidation.dart';

// --> Exporting [service] 
export 'src/service/service_i.dart';
export 'src/service/service_b.dart';

// --> Exporting [service.decoding]
export 'src/service/decoding/encodable_i.dart';
export 'src/service/decoding/decodable_i.dart';
export 'src/service/decoding/variation_i.dart';

// --> Exporting [service.entity]
export 'src/service/entity/entity_i.dart';
export 'src/service/entity/entity_b.dart';
export 'src/service/entity/named_entity_b.dart';
export 'src/service/entity/named_entity_i.dart';

// --> Exporting [service.response]
export 'src/service/response/response_controller_i.dart';
export 'src/service/response/response_controller_b.dart';
export 'src/service/response/response_controller.dart';
export 'src/service/response/response_resolver_i.dart';
export 'src/service/response/response_resolver_b.dart';
