// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rollingClientIdsListHash() =>
    r'56029c1e2c6bba96a68bffeca6d5ca69f47b07e9';

/// Provider that exposes the list of client ids of the Rolling.
///
/// Copied from [RollingClientIdsList].
@ProviderFor(RollingClientIdsList)
final rollingClientIdsListProvider =
    NotifierProvider<RollingClientIdsList, List<String>>.internal(
      RollingClientIdsList.new,
      name: r'rollingClientIdsListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rollingClientIdsListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RollingClientIdsList = Notifier<List<String>>;
String _$stealthModeStatusHash() => r'2ea428ec5fb75bb57a60d699ab81d7f2c4e3a106';

/// Provider that exposes the value of the Stealth mode.
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
String _$rollingClientCurrentIndexHash() =>
    r'961dc389e6f5b42637810cbfc8b9d0972b3b5268';

/// Provider that handle the current index of the Rolling client mode
///
/// Copied from [RollingClientCurrentIndex].
@ProviderFor(RollingClientCurrentIndex)
final rollingClientCurrentIndexProvider =
    NotifierProvider<RollingClientCurrentIndex, int>.internal(
      RollingClientCurrentIndex.new,
      name: r'rollingClientCurrentIndexProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rollingClientCurrentIndexHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RollingClientCurrentIndex = Notifier<int>;
String _$rollingClientStatusHash() =>
    r'f9e3587a981726f64cad4e096f2268578f1cde82';

/// Provider that exposes the value of the Rolling client.
///
/// Copied from [RollingClientStatus].
@ProviderFor(RollingClientStatus)
final rollingClientStatusProvider =
    NotifierProvider<RollingClientStatus, bool>.internal(
      RollingClientStatus.new,
      name: r'rollingClientStatusProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rollingClientStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RollingClientStatus = Notifier<bool>;
String _$generationFieldsStatusHash() =>
    r'7cf6de199562b3b4b07d565d06cea020241af8a2';

/// Provider that exposes the fields that are used to generate the QR code
///
/// Copied from [GenerationFieldsStatus].
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
String _$expirationCheckMapHash() =>
    r'4bf41ce8f1b08efcf3e4c0dc7ccb2ab50b1cd810';

/// Provider that exposes the map of ExpirationCheck models
/// clientId -> ResponseExpirationCheckModel
///
/// Copied from [ExpirationCheckMap].
@ProviderFor(ExpirationCheckMap)
final expirationCheckMapProvider =
    NotifierProvider<ExpirationCheckMap, Map<int, DateTime>>.internal(
      ExpirationCheckMap.new,
      name: r'expirationCheckMapProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$expirationCheckMapHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ExpirationCheckMap = Notifier<Map<int, DateTime>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
