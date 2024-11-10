import 'package:connectivity_plus/connectivity_plus.dart';

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  /// Checks if the internet is connected or not
  /// Returns [true] if internet is connected,
  /// else it will return [false].
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  // Checks the type of internet connectivity
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  // Checks the type of internet connection on changes in internet connection
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
