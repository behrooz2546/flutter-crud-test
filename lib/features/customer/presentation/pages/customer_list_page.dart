import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/customer_form_page.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/customer_item.dart';

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CustomerListBloc, CustomerListState>(
      builder: (context, state) {
        if (state is CustomerListLoadedState) {
          return _buildListView(state);
        } else if (state is CustomerListLoadingState) {
          return _buildLoadingState();
        }

        return Container();
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Customer List",
        style: TextStyle(color: Colors.amberAccent),
      ),
      actions: [
        _buildAddAction(),
      ],
    );
  }

  Widget _buildListView(CustomerListLoadedState state) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          CustomerItem(model: state.customers[index]),
      separatorBuilder: ((context, index) => 8.verticalSpace),
      itemCount: state.customers.length,
    );
  }

  Widget _buildAddAction() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: _handleAddButtonTapped,
        child: Icon(
          Icons.add,
          size: 26.r,
        ),
      ),
    );
  }

  void _handleAddButtonTapped() {
    CustomerFormPage.show(context: context);
  }

  Widget _buildLoadingState() {
    return const Center(child: CupertinoActivityIndicator());
  }
}
