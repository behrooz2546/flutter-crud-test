import 'package:mc_crud_test/config/constants.dart';

class CreateCustomerRequest {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  const CreateCustomerRequest({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });
}
