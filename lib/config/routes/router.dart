import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/routes/route_handlers.dart';

class Routes {
  static String rootPath = "/";
  static String customerListPath = "/customerList";
  static String customerFormPath = "/customerForm";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) {
        debugPrint("ROUTE WAS NOT FOUND !!!");
        return;
      },
    );
    router.define(rootPath, handler: customerListHanlder);
    router.define(customerListPath, handler: customerListHanlder);
    router.define(customerFormPath, handler: customerFormHanlder);
  }
}
