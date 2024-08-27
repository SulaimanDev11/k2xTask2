
import 'package:flutter_task/app/data/params/params.dart';

import '../repository/repository.dart';
import 'usecase.dart';

class SaveUserUsecase extends Usecase<bool, SaveUserParams> {
  final Repository repository;

  SaveUserUsecase({required this.repository});

  @override
  Future<bool> call(SaveUserParams params) async {
    bool? res = await repository.saveUserData(params:params);
    return res!;
  }
}