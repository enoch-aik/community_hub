import 'package:community_hub/app/auth/data/data_source/auth_datasource_impl.dart';
import 'package:community_hub/app/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///This is the provider for the auth datasource
final authDataSourceProvider = Provider((ref) => AuthDataSourceImpl(ref));

///This is the provider for the auth repo
final authRepoProvider =
    Provider((ref) => AuthRepoImpl(ref.watch(authDataSourceProvider)));
