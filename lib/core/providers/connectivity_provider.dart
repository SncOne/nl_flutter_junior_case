import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/services/connectivity_service.dart';

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  final service = ConnectivityService();
  ref.onDispose(service.dispose);
  return service;
});

final connectivityStatusProvider = StreamProvider<ConnectivityStatus>((ref) {
  return ref.watch(connectivityServiceProvider).onStatusChange;
});

final connectivityMonitorProvider = Provider<void>((ref) {
  ref.listen<AsyncValue<ConnectivityStatus>>(connectivityStatusProvider, (
    previous,
    next,
  ) {
    final router = ref.read(routerProvider);

    final prevStatus = previous?.asData?.value;
    final nextStatus = next.asData?.value;

    if (nextStatus == ConnectivityStatus.none) {
      router.push(const NoConnectionRoute());
    }

    if (prevStatus == ConnectivityStatus.none &&
        nextStatus != null &&
        nextStatus != ConnectivityStatus.none) {
      router.removeWhere((route) => route.name == NoConnectionRoute.name);
    }
  });
});
