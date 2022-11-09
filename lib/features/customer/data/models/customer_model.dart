import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel extends Equatable {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'firstName')
  final String firstName;

  @JsonKey(name: 'lastName')
  final String lastName;

  @JsonKey(name: 'dateOfBirth')
  final DateTime dateOfBirth;

  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'bankAccountNumber')
  final String bankAccountNumber;

  const CustomerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  List<Object?> get props => [];

  static getAlls() => List<CustomerModel>.empty();
}
