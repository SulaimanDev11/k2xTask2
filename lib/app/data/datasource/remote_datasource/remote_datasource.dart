import 'package:flutter_task/app/data/params/params.dart';

abstract class RemoteDataSource {
  Future<bool> saveUserData({required SaveUserParams params});
}
