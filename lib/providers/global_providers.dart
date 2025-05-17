import 'package:riverpod_annotation/riverpod_annotation.dart';

part "global_providers.g.dart";

/// Provider that expose the value of the Stealth mode.
/// Default is true, to have 100% hiding capabilities to the staff
@Riverpod(keepAlive: true)
class StealthModeStatus extends _$StealthModeStatus {

  @override
  bool build() => true;

  void changeStatus(bool newValue) => state = newValue;
  void reset() => state = true;
}
