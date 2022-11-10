import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/config/routes/application.dart';
import 'package:mc_crud_test/config/themes/app_themes.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_database_service.dart';

import 'config/routes/router.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // config service locator
  await di.init();

  // config fluro router
  final router = FluroRouter();
  Routes.configureRoutes(router);

  Application.router = router;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.light,
          home: child,
          onGenerateRoute: Application.router.generator,
        );
      },
    );
  }
}
