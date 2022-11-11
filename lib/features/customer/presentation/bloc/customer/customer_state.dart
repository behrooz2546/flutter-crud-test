part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {}

class CustomerInitial extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerErrorState extends CustomerState {
  final String errorMessage;

  CustomerErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CustomerLoadingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerSuccessCreateState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerSuccessUpdateState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerSuccessDeleteState extends CustomerState {
  @override
  List<Object?> get props => [];
}
