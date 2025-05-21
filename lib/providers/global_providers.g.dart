// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stealthModeStatusHash() => r'2ea428ec5fb75bb57a60d699ab81d7f2c4e3a106';

/// Provider that expose the value of the Stealth mode.
/// Default is true, to have 100% hiding capabilities to the staff
///
/// Copied from [StealthModeStatus].
@ProviderFor(StealthModeStatus)
final stealthModeStatusProvider =
    NotifierProvider<StealthModeStatus, bool>.internal(
      StealthModeStatus.new,
      name: r'stealthModeStatusProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$stealthModeStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$StealthModeStatus = Notifier<bool>;
String _$generationFieldsStatusHash() =>
    r'7cf6de199562b3b4b07d565d06cea020241af8a2';

/// See also [GenerationFieldsStatus].
@ProviderFor(GenerationFieldsStatus)
final generationFieldsStatusProvider =
    NotifierProvider<GenerationFieldsStatus, Map<String, dynamic>>.internal(
      GenerationFieldsStatus.new,
      name: r'generationFieldsStatusProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$generationFieldsStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GenerationFieldsStatus = Notifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
