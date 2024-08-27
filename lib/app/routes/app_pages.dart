import 'package:flutter_task/app/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:flutter_task/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_task/app/modules/dashboard/views/take_break_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const iNITIAL = Routes.cHECKINCHECKOUT;

  static final routes = [
    GetPage(
      name: _Paths.cHECKINCHECKOUT,
      page: () => const DashboardScreenView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.aDDBREAK,
      page: () => const TakeBreakScreenView(),
      binding: DashboardBinding(),
    ),
  ];
}
