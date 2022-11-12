part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {}

class CustomerCreateEvent extends CustomerEvent {
  final CreateCustomerRequest request;

  CustomerCreateEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class CustomerUpdateEvent extends CustomerEvent {
  final CustomerModel request;

  CustomerUpdateEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class CustomerDeleteEvent extends CustomerEvent {
  final CustomerModel customer;

  CustomerDeleteEvent(this.customer);

  @override
  List<Object?> get props => [customer];
}
