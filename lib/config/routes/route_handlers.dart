import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/customer_list_page.dart';

var customerListHanlder = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return CustomerListPage();
});

var customerFormHanlder = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Container();
});
