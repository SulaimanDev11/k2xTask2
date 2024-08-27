import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/app/data/di/di.dart';
import 'package:flutter_task/app/l10n/strings.dart';
import 'package:flutter_task/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_task/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'app/utils/loader/loader.dart';

// Icon(Icons.pause),
// Icon(Icons.play_arrow),
// Icon(Icons.arrow_forward),
// Icon(Icons.watch_later_outlined),
// Icon(Icons.calendar_month),
// Icon(Icons.add),

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Di.inject();
  Load.configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 900),
      builder: (_, __) => GetMaterialApp(
        title: AppStrings.appBarTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreenView(),
        initialRoute: AppPages.iNITIAL,
        builder: Load.init(),
      ),
    );
  }
}
