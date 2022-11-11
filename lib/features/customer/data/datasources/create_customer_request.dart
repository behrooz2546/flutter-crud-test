import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/config/constants.dart';

class CreateCustomerRequest extends Equatable {
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

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnFirstName: firstName,
      columnLastName: lastName,
      columnDateOfBirth: dateOfBirth.toIso8601String(),
      columnPhoneNumber: phoneNumber,
      columnEmail: email,
      columnBankAccountNumber: bankAccountNumber,
    };

    return map;
  }

  @override
  List<Object?> get props => [email, phoneNumber];
}
