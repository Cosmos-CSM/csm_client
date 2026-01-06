/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: directives_ordering
library;

export 'package:http/http.dart' show Client, Request, Response;
export 'package:http/testing.dart' show MockClient, MockClientHandler, MockClientStreamHandler;

//! --> Exporting modules

export 'src/abstractions/abstractions_module.dart';


// --> Exporting [src] 
export 'src/abstractions/interfaces/iserver.dart';
export 'src/abstractions/bases/server_base.dart';

export 'src/core/user_feedback_severities.dart';

// --> Exporting [common]
export 'src/common/enums.dart';
export 'src/common/typedefs.dart';
export 'src/common/extensions.dart';
export 'src/common/constants.dart';

// --> Exporting [common.exceptions]
export 'src/common/exceptions/traced_exception.dart';

// --> Exporting [models]
export 'src/core/models/uri.dart';
export 'src/core/models/property_info.dart';
export 'src/core/models/entity_invalidation.dart';
export 'src/core/models/user_feedback.dart';
export 'src/core/models/error_info.dart';

export 'src/core/models/frames/failure_frame.dart';
export 'src/core/models/frames/succcess_frame.dart';

// --> Exporting [service] 
export 'src/abstractions/interfaces/iservice.dart';
export 'src/abstractions/bases/service_base.dart';

// --> Exporting [service.decoding]
export 'src/abstractions/interfaces/iencodable.dart';
export 'src/abstractions/interfaces/idecodable.dart';
export 'src/abstractions/interfaces/ivariation.dart';

//! --> [Service]

//! --> [Service.Entity]

export 'src/abstractions/bases/entity_base.dart';
export 'src/service/entity/named_entity_b.dart';
export 'src/service/entity/common_entity_b.dart';
export 'src/service/entity/referenced_entity_b.dart';
export 'src/service/entity/named_referenced_entity_b.dart';

//! <-- [Service.Entity]

//! <-- [Service]

// --> Exporting [service.response]
export 'src/service/response/abstractions/interfaces/iresponse_controller.dart';
export 'src/service/response/abstractions/bases/response_controller_base.dart';
export 'src/service/response/response_controller.dart';
export 'src/service/response/abstractions/interfaces/iresponse_resolver.dart';
export 'src/service/response/abstractions/bases/response_resolver_base.dart';
