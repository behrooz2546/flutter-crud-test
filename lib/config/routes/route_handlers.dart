import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/customer_list_page.dart';
import 'package:mc_crud_test/service_locator.dart';

var customerListHanlder = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) {
      return sl<CustomerListBloc>()
        ..add(
          CustomerListLoadEvent(),
        );
    },
    child: CustomerListPage(),
  );
});

var customerFormHanlder = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Container();
});
