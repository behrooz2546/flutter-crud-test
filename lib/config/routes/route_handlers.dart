import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_database_service_impl.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/customer_list_page.dart';

var customerListHanlder = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) {
      final databaseService = CustomerDatabaseServiceImpl();
      final repository = CustomerRepositoryImpl(databaseService);
      final usecase = GetAllCustomersUsecase(repository);
      return CustomerListBloc(usecase)
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
