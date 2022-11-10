part of 'customer_list_bloc.dart';

abstract class CustomerListEvent extends Equatable {
  const CustomerListEvent();

  @override
  List<Object> get props => [];
}

class CustomerListLoadEvent extends CustomerListEvent {}

class CustomerListDeleteEvent extends CustomerListEvent {}
