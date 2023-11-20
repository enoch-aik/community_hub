import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  final LocalAuthentication localAuthentication;

  BiometricAuth({required this.localAuthentication});

  ///check if device can check biometrics
  Future<bool> canUseBiometric() async =>
      await localAuthentication.canCheckBiometrics;

  /// check if biometrics is enabled
  Future<bool> isDeviceSupported() async =>
      await localAuthentication.isDeviceSupported();

  ///check if device has biometrics
  Future<bool> hasBiometrics() async {
    try {
      return (await localAuthentication.getAvailableBiometrics()).isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  ///authenticate user
  Future<bool> authenticate(
      {String? message, bool sensitiveTransaction = false}) async {
    bool isBiometricEnabled = false;
    try {
      isBiometricEnabled = await localAuthentication.authenticate(
        localizedReason: message ?? "Authenticate?",
        options: AuthenticationOptions(
          stickyAuth: true,
          //biometricOnly: true,
          sensitiveTransaction: sensitiveTransaction,
        ),
      );
    } catch (_) {
      isBiometricEnabled = false;
    }
    return isBiometricEnabled;
  }

  ///cancel authentication
  Future<void> cancelAuthentication() async =>
      await localAuthentication.stopAuthentication();
}
