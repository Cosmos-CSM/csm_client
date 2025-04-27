# Changelog

Changelog history for [csm_client] package.

## 8.0.0 - [27.04-2025]

- Notes:

    1. Reestructure of file management.

    2. Added the [timestamp] property for Entities, and added [EntityB] to auto handle these properties.

    3. Refactorized naming conventions for interfaces and abstract classes.

    4. Changed concepts:

        - CSMActEffect -> ResponseController

        - CSMServiceResolver -> ResponseResolver

- Fixes: N/A

- Dependencies:

    | Package                                 | Previous Version | Current Version |
    |:----------------------------------------|:----------------:|:---------------:|
    | http                                    | 1.3.0            | 1.3.0           |
    | meta                                    | ---              | 1.16.0          |

- Dev Dependencies:

    | Package                                 | Previous Version | Current Version |
    |:----------------------------------------|:----------------:|:---------------:|
    | lints                                   | ---              | 5.1.1           |
    | test                                    | ---              | 1.25.15         |

## 7.0.0 - [24.09-2024]

- Notes:

        1. [removed] CSMDecodeInterface due to is not necessary anymore, moved to callback factory.
        2. [deprecated] [deserealize] function native/web implementations due to the previous movement from [CSMDecodeInterface]'s to callback factories. 

- Dependencies: N/A

## 6.0.0

- Modified naming convention for extension files.

        1. Now files starts with csm as another files.
        2. Now have the name of the native type extended and the extension word.

- Documentation improvements for extensions.

- Dependencies upgrade:

        1. collection ([1.18.0] -> [1.19.0])
        2. http_parser ([4.0.2] -> [4.1.0])
        3. shelf ([1.4.1] -> [1.4.2])
        4. vm_service ([14.2.3] -> [14.2.4]) 

## 5.1.0

- Added [MIgration] CSM products internal concept objects handling, including:

        1. [CSMSetInterface]: That represents a [Migration] set definition.
        2. [CSMSetValidationResult]: Structure that stores a set property validation error result.

- Additional:

        1. Upgraded [lints] from (3.0.0) to (4.0.0).

## 5.0.1

- Added JObject utils for binding.

        1. Now can be binded [bool] properties.
        2. Now can be binded [Map<String, dynamic>] properties [{JObject}]
        3. Now can be binded [List<Map<String, dynamic>>] proeprties [{List<JObject>}]

## 5.0.0

- Added serialization support along vm and jsinterop platforms where [dart:mirrors] aren´t allowed,
throughout abstraction bypassing of decoders or mirroring.

        1. NOTE: For jsinterop platforms is required to provide [decoders] implementations.
        2. NOTE: For native platforms [dart:mirrors] at the current date doesn't allow instancing generic factories classes.

## 1.0.0

- Initial version.
