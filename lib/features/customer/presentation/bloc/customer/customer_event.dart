part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class CustomerCreateEvent extends CustomerEvent {
  final CreateCustomerRequest request;

  const CustomerCreateEvent(this.request);
}

class CustomerUpdateEvent extends CustomerEvent {
  final UpdateCustomerRequest request;

  const CustomerUpdateEvent(this.request);
}

class CustomerDeleteEvent extends CustomerEvent {
  final CustomerModel customer;

  const CustomerDeleteEvent(this.customer);
}
