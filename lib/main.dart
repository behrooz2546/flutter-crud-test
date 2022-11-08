import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/routes/app_routes.dart';
import 'package:mc_crud_test/config/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
