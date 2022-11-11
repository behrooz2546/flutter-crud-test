part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

class CustomerInitial extends CustomerState {}

class CustomerErrorState extends CustomerState {
  final String errorMessage;

  const CustomerErrorState(this.errorMessage);
}

class CustomerloadingState extends CustomerState {}

class CustomerSuccessCreateState extends CustomerState {}

class CustomerSuccessUpdateState extends CustomerState {}

class CustomerSuccessDeleteState extends CustomerState {}
