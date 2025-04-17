import 'package:csm_client/csm_client.dart';

/// [Abstract] class for [Entities] base members handling and operations.
abstract class EntityB implements EntityI {
  /// Unique specific object identification.
  @override
  String discriminator = "";

  /// Entity database pointer.
  @override
  int id = 0;

  /// Entity handling timestamp.
  @override
  DateTime timestamp = DateTime.now();
}
