import 'package:flutter_task/app/data/di/di.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(saveUserUsecase: sl()),
    );
  }
}
