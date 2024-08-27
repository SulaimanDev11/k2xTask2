import 'package:flutter_task/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../datasource/remote_datasource/remote_datasource.dart';
import '../datasource/remote_datasource/remote_datasource_impl.dart';
import '../repository/repository.dart';
import '../repository/repository_impl.dart';
import '../usecase/save_user_usecase.dart';

final sl = Get.find;

class Di {
  Di._();

  static void inject() {
    /// [Repository]
    Get.lazyPut<Repository>(() => RepositoryImpl(remoteDataSource: sl()),
        fenix: true);

    /// [Datasources]
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);

    /// [Usecases]
    Get.lazyPut<SaveUserUsecase>(() => SaveUserUsecase(repository: sl()),
        fenix: true);

    /// [controller]
    Get.lazyPut<DashboardController>(
        () => DashboardController(saveUserUsecase: sl()),
        fenix: true);
  }
}
