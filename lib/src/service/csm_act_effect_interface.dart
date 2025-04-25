import 'package:csm_client/csm_client.dart';

/// Interface for [CSMActEffect].
///
/// Defines require behavior for a [CSMActEffect] implementation.
///
/// [CSMActEffect] Concept: a service response.
abstract interface class CSMActEffectInterface {
  /// Resolves the current [CSMActEffect].
  ///
  /// [onSuccess] - When the [ActEffect] resulves successfuly.
  /// [onFailure] - When the [ActEffect] receives a failed [StatusCode].
  /// [onException] - When the [ActEffect] got interrupted by an exception.
  void resolve(
    Function(DataMap success) onSuccess,
    Function(DataMap failure, int statusCode) onFailure,
    Function(Object exception, StackTrace trace) onException,
  );
}
