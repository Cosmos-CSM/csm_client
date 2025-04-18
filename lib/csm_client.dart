/// Support for doing something awesome.
///
/// More dartdocs go here.
// ignore_for_file: directives_ordering

library;

export 'package:http/src/client.dart' show Client;
export 'package:http/src/request.dart';
export 'package:http/src/response.dart';
export 'package:http/testing.dart';

// --> Exportin [src] <-- //
export 'src/csm_server_interface.dart';
export 'src/csm_server_base.dart';

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

// --> Exporting [Models] <-- //
export 'src/models/csm_entity_invalid_property.dart';
export 'src/models/csm_uri.dart';

// --> Exporting [common] scope objects <-- //
export 'src/common/typedefs.dart';
export 'src/common/csm_protocols.dart';

// --> Exporting [common.constants] <-- //
export 'src/common/constants/entity_keys.dart';

// --> Exporting [common.extensions] <-- //
export 'src/common/extensions/csm_int_extension.dart';
export 'src/common/extensions/csm_jobject_extension.dart';
export 'src/common/extensions/csm_string_extension.dart';
