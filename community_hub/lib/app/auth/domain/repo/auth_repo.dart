import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/data/models/new_worker.dart';
import 'package:community_hub/app/auth/domain/params/user_credentials.dart';
import 'package:community_hub/core/service_result/src/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<ApiResult<UserCredential>> googleSignIn();

  Future<ApiResult<UserCredential>> clientLogin(UserCred user);

  Future<ApiResult<UserCredential>> signUpWithEmailAndPassword(NewClient user);

  Future<ApiResult<UserCredential>> workerSignUp(NewWorker worker);

  Future<ApiResult<UserCredential>> workerLogin(UserCred user);

  Future<ApiResult<void>> forgotPassword(String email);

  Future<ApiResult<bool>> updateFcmToken(
      {required String fcmToken,
      required String email,
      required String userType});
}
