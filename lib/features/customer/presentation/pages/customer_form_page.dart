import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/routes/application.dart';
import 'package:mc_crud_test/config/routes/arguments.dart';
import 'package:mc_crud_test/config/routes/router.dart';

class CustomerFormPage extends StatefulWidget {
  final CustomerFormPageArguments arguments;
  CustomerFormPage({Key? key, required this.arguments}) : super(key: key);

  static show({
    required BuildContext context,
  }) {
    Application.router.navigateTo(
      context,
      Routes.customerFormPath,
      routeSettings: RouteSettings(
        arguments: CustomerFormPageArguments(),
      ),
      transition: TransitionType.cupertino,
    );
  }

  @override
  State<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends State<CustomerFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Customer"),
      actions: const [],
    );
  }

  Widget _buildBody() {
    return const Center(
      child: Text("Form"),
    );
  }
}
