part of 'customer_list_bloc.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();

  @override
  List<Object> get props => [];
}

class CustomerListInitial extends CustomerListState {}

class CustomerListLoadingState extends CustomerListState {}

class CustomerListLoadedState extends CustomerListState {
  final List<CustomerModel> customers;

  const CustomerListLoadedState(this.customers);
}

class CustomerListErrorState extends CustomerListState {}
