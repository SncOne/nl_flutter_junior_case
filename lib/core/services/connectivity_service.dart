import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { wifi, mobile, ethernet, vpn, bluetooth, other, none }

class ConnectivityService {
  ConnectivityService() {
    _initialize();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityStatus> _statusController =
      StreamController<ConnectivityStatus>.broadcast();

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  ConnectivityStatus? _lastStatus;

  Stream<ConnectivityStatus> get onStatusChange => _statusController.stream;

  void _initialize() {
    checkConnectivity().then((status) {
      _lastStatus = status;
      _statusController.add(status);
    });

    _subscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final status = _mapResultsToStatus(results);

      if (status != _lastStatus) {
        _lastStatus = status;
        _statusController.add(status);
      }
    });
  }

  Future<ConnectivityStatus> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    return _mapResultsToStatus(results);
  }

  Future<bool> isConnected() async {
    final status = await checkConnectivity();
    return status != ConnectivityStatus.none;
  }

  ConnectivityStatus _mapResultsToStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      return ConnectivityStatus.wifi;
    }
    if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityStatus.mobile;
    }
    if (results.contains(ConnectivityResult.ethernet)) {
      return ConnectivityStatus.ethernet;
    }
    if (results.contains(ConnectivityResult.vpn)) {
      return ConnectivityStatus.vpn;
    }
    if (results.contains(ConnectivityResult.bluetooth)) {
      return ConnectivityStatus.bluetooth;
    }
    if (results.contains(ConnectivityResult.other)) {
      return ConnectivityStatus.other;
    }
    return ConnectivityStatus.none;
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _statusController.close();
  }
}
