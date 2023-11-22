
import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/data/models/new_worker.dart';
import 'package:community_hub/app/auth/domain/params/user_credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  ///auth for patient
  Future<UserCredential> clientLogin(UserCred user);

  /// sigin in with google
  Future<UserCredential> googleSignIn();

  /// forget password to reset password
  Future<void> forgotPassword(String email);

  /// signup with email and password
  Future<UserCredential> signUpWithEmailAndPassword(NewClient user);

  ///auth for doctor
  Future<UserCredential> workerSignUp(NewWorker worker);

  /// loqin for doctor
  Future<UserCredential> workerLogin(UserCred user);

  /// update fcm token to receive notification
  Future<bool> updateFcmToken(
      {required String fcmToken,
      required String email,
      required String userType});
}
