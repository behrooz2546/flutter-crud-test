import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emailAddressTextEditingController = TextEditingController();
  final phoneNumberTextEditingController = TextEditingController();
  final accountNumberTextEditingController = TextEditingController();

  DateTime? selectedDate;

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
    return SafeArea(
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
    debugPrint("handleSaveButtonPressed");
  }
}
