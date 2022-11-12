import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/config/routes/application.dart';
import 'package:mc_crud_test/config/routes/arguments.dart';
import 'package:mc_crud_test/config/routes/router.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer/customer_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';
import 'package:mc_crud_test/service_locator.dart';

class CustomerFormPage extends StatefulWidget {
  final CustomerFormPageArguments arguments;
  CustomerFormPage({Key? key, required this.arguments}) : super(key: key);

  static show({
    required BuildContext context,
    CustomerModel? customer,
  }) {
    final setting =
        RouteSettings(arguments: CustomerFormPageArguments(customer: customer));
    Application.router.navigateTo(
      context,
      Routes.customerFormPath,
      routeSettings: setting,
      transition: TransitionType.cupertino,
    );
  }

  @override
  State<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends State<CustomerFormPage> {
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emailAddressTextEditingController = TextEditingController();
  final phoneNumberTextEditingController = TextEditingController();
  final accountNumberTextEditingController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    firstNameTextEditingController.text =
        widget.arguments.customer?.firstName ?? "";
    lastNameTextEditingController.text =
        widget.arguments.customer?.lastName ?? "";
    emailAddressTextEditingController.text =
        widget.arguments.customer?.email ?? "";
    phoneNumberTextEditingController.text =
        widget.arguments.customer?.phoneNumber ?? "";
    accountNumberTextEditingController.text =
        widget.arguments.customer?.bankAccountNumber ?? "";
    selectedDate = widget.arguments.customer?.dateOfBirth;
  }

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
      actions: [
        _buildDeleteAction(),
      ],
    );
  }

  Widget _buildDeleteAction() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: _handleDeleteButtonTapped,
        child: Icon(
          Icons.delete,
          size: 26.r,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocListener<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state is CustomerSuccessCreateState) {
          _handleCustomerSuccessCreateState(state);
        }

        if (state is CustomerSuccessUpdateState) {
          _handleCustomerSuccessUpdateState(state);
        }

        if (state is CustomerSuccessDeleteState) {
          _handleCustomerSuccessDeleteState(state);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              _buildFirstNameField(),
              16.verticalSpace,
              _buildLastNameField(),
              16.verticalSpace,
              _buildEmailAddressField(),
              16.verticalSpace,
              _buildPhoneNumberField(),
              16.verticalSpace,
              _buildBirthDateFiled(),
              16.verticalSpace,
              _buildAccountNumberField(),
              const Spacer(),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return TextField(
      controller: firstNameTextEditingController,
      decoration: const InputDecoration(hintText: "first Name"),
    );
  }

  Widget _buildLastNameField() {
    return TextField(
      controller: lastNameTextEditingController,
      decoration: const InputDecoration(hintText: "Last Name"),
    );
  }

  Widget _buildEmailAddressField() {
    return TextField(
      controller: emailAddressTextEditingController,
      decoration: const InputDecoration(hintText: "Email Address"),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPhoneNumberField() {
    return TextField(
      controller: phoneNumberTextEditingController,
      decoration: const InputDecoration(hintText: "Phone Number"),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildBirthDateFiled() {
    return Row(
      children: [
        const Text("DateOfBirth:"),
        const Spacer(),
        TextButton(
          onPressed: () => _handleSelectDateButtonPressed(context),
          child: selectedDate == null
              ? const Text("Select date")
              : Text("${selectedDate!.toLocal()}".split(' ')[0]),
        )
      ],
    );
  }

  Widget _buildAccountNumberField() {
    return TextField(
      controller: accountNumberTextEditingController,
      decoration: const InputDecoration(hintText: "Account Number"),
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSaveButtonPressed,
        child: const Text("Save"),
      ),
    );
  }

  Future<void> _handleSelectDateButtonPressed(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2023),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _handleSaveButtonPressed() {
    if (widget.arguments.customer != null) {
      final updateRequest = CustomerModel(
        id: widget.arguments.customer?.id ?? 1,
        bankAccountNumber: accountNumberTextEditingController.text,
        firstName: firstNameTextEditingController.text,
        lastName: lastNameTextEditingController.text,
        email: emailAddressTextEditingController.text,
        dateOfBirth: selectedDate ?? DateTime.now(),
        phoneNumber: phoneNumberTextEditingController.text,
      );
      BlocProvider.of<CustomerBloc>(context).add(
        CustomerUpdateEvent(updateRequest),
      );
      return;
    }
    debugPrint("handleSaveButtonPressed");
    final createRequest = CreateCustomerRequest(
      bankAccountNumber: accountNumberTextEditingController.text,
      firstName: firstNameTextEditingController.text,
      lastName: lastNameTextEditingController.text,
      email: emailAddressTextEditingController.text,
      dateOfBirth: selectedDate ?? DateTime.now(),
      phoneNumber: phoneNumberTextEditingController.text,
    );
    BlocProvider.of<CustomerBloc>(context).add(
      CustomerCreateEvent(createRequest),
    );
  }

  void _handleCustomerSuccessCreateState(CustomerSuccessCreateState state) {
    sl<CustomerListBloc>().add(CustomerListLoadEvent());
    Application.backTo(context, Routes.rootPath);
  }

  void _handleCustomerSuccessUpdateState(CustomerSuccessUpdateState state) {
    sl<CustomerListBloc>().add(CustomerListLoadEvent());
    Application.backTo(context, Routes.rootPath);
  }

  void _handleCustomerSuccessDeleteState(CustomerSuccessDeleteState state) {
    sl<CustomerListBloc>().add(CustomerListLoadEvent());
    Application.backTo(context, Routes.rootPath);
  }

  void _handleDeleteButtonTapped() {
    debugPrint("_handleDeleteButtonTapped");
    BlocProvider.of<CustomerBloc>(context).add(
      CustomerDeleteEvent(widget.arguments.customer!),
    );
  }
}
