import 'package:flutter_task/app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_task/app/data/params/params.dart';
import 'repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> saveUserData({required SaveUserParams params}) async {
    return await remoteDataSource.saveUserData(params: params);
  }
}
