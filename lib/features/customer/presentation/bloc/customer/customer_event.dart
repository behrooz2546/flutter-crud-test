part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class CustomerCreateEvent extends CustomerEvent {
  final CustomerModel customer;

  const CustomerCreateEvent(this.customer);
}

class CustomerUpdateEvent extends CustomerEvent {
  final CustomerModel customer;

  const CustomerUpdateEvent(this.customer);
}
