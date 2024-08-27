import 'package:flutter_task/app/data/params/params.dart';

abstract class Repository {
  Future<bool?> saveUserData({required SaveUserParams params});
}
