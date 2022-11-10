import 'package:flutter/material.dart';

class CustomerListPage extends StatefulWidget {
  CustomerListPage({Key? key}) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text("Customer"),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Customer List"),
      actions: const [],
    );
  }
}
