import 'package:csm_client/csm_client.dart';

/// Class for [CSMActEffect].
///
/// Defines final behavior for a [CSMActEffect] implementation.
///
/// [CSMActEffect] Concept: a service response.
final class CSMActEffect extends CSMActEffectBase {
  /// Generates a [CSMActEffect] object.
  const CSMActEffect({
    super.success,
    super.error,
    super.exception,
    super.trace,
    super.status,
  });
}
