import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mc_crud_test/config/constants.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel extends Equatable {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'dateOfBirth')
  DateTime? dateOfBirth;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'bankAccountNumber')
  String? bankAccountNumber;

  CustomerModel({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.email,
    this.bankAccountNumber,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnFirstName: firstName,
      columnLastName: lastName,
      columnDateOfBirth: dateOfBirth?.toIso8601String(),
      columnPhoneNumber: phoneNumber,
      columnEmail: email,
      columnBankAccountNumber: bankAccountNumber,
    };

    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) => CustomerModel(
        id: map[columnId] as int,
        firstName: map[columnFirstName] as String,
        lastName: map[columnLastName] as String,
        dateOfBirth: DateTime.parse(map[columnDateOfBirth] as String),
        phoneNumber: map[columnPhoneNumber] as String,
        email: map[columnEmail] as String,
        bankAccountNumber: map[columnBankAccountNumber] as String,
      );

  @override
  List<Object?> get props => [];

  static getAlls() => List<CustomerModel>.empty();
}
