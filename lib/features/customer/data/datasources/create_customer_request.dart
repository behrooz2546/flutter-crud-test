import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [email, phoneNumber];
}
