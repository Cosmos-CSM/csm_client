/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: directives_ordering

library;

export 'package:http/src/client.dart' show Client;

// --> Exportin [src] 
export 'src/server_i.dart';
export 'src/server_b.dart';

// --> Exporting [common]
export 'src/common/enums.dart';
export 'src/common/typedefs.dart';
export 'src/common/extensions.dart';
export 'src/common/constants.dart';

// --> Exporting [models]
export 'src/models/uri.dart';
export 'src/models/property_info.dart';
export 'src/models/entity_invalidation.dart';

// --> Exporting [service] scope obejcts <-- //
export 'src/service/csm_act_effect.dart';
export 'src/service/csm_act_effect_base.dart';
export 'src/service/csm_act_effect_interface.dart';
export 'src/service/entity_i.dart';
export 'src/service/entity_b.dart';
export 'src/service/named_entity_i.dart';
export 'src/service/named_entity_b.dart';
export 'src/service/csm_service_interface.dart';
export 'src/service/csm_service_resolver_interface.dart';
export 'src/service/csm_service_base.dart';
export 'src/service/csm_service_resolver_base.dart';

// --> Exporting [service.decoding] <--
export 'src/service/decoding/encodable_i.dart';
export 'src/service/decoding/decodable_i.dart';
export 'src/service/decoding/variation_i.dart';
