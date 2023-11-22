import 'package:community_hub/app/auth/data/data_source/auth_datasource_impl.dart';
import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/data/models/new_worker.dart';
import 'package:community_hub/app/auth/domain/params/user_credentials.dart';
import 'package:community_hub/app/auth/domain/repo/auth_repo.dart';
import 'package:community_hub/core/helpers/dio_interceptor.dart';
import 'package:community_hub/core/service_result/src/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthDataSourceImpl _dataSource;

  AuthRepoImpl(this._dataSource);

  @override
  Future<ApiResult<UserCredential>> googleSignIn() =>
      apiInterceptor(() => _dataSource.googleSignIn());

  @override
  Future<ApiResult<UserCredential>> clientLogin(UserCred user) =>
      apiInterceptor(() => _dataSource.clientLogin(user));

  @override
  Future<ApiResult<UserCredential>> signUpWithEmailAndPassword(
          NewClient user) =>
      apiInterceptor(() => _dataSource.signUpWithEmailAndPassword(user));

  @override
  Future<ApiResult<void>> forgotPassword(String email) =>
      apiInterceptor(() => _dataSource.forgotPassword(email));

  @override
  Future<ApiResult<UserCredential>> workerSignUp(NewWorker worker) =>
      apiInterceptor(() => _dataSource.workerSignUp(worker));

  @override
  Future<ApiResult<UserCredential>> workerLogin(UserCred user) =>
      apiInterceptor(() => _dataSource.workerLogin(user));

  @override
  Future<ApiResult<bool>> updateFcmToken(
          {required String fcmToken,
          required String email,
          required String userType}) =>
      apiInterceptor(() => _dataSource.updateFcmToken(
          fcmToken: fcmToken, email: email, userType: userType));
}
