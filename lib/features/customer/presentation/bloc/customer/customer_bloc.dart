import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/create_customer_usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer_usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/update_customer_usecase.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CreateCustomerUsecase createCustomerUsecase;
  final UpdateCustomerUsecase updateCustomerUsecase;
  final DeleteCustomerUsecase deleteCustomerUsecase;

  CustomerBloc({
    required this.createCustomerUsecase,
    required this.updateCustomerUsecase,
    required this.deleteCustomerUsecase,
  }) : super(CustomerInitial()) {
    on<CustomerEvent>((event, emit) {
      on<CustomerCreateEvent>(_onCustomerCreateEvent);
      on<CustomerUpdateEvent>(_onCustomerUpdateEvent);
      on<CustomerDeleteEvent>(_onCustomerDeleteEvent);
    });
  }

  FutureOr<void> _onCustomerDeleteEvent(
      CustomerDeleteEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerloadingState());

    final result =
        await deleteCustomerUsecase.call(event.customer.id?.toString() ?? "");
    result.fold(
      (error) {
        emit(CustomerErrorState(error.toString()));
      },
      (success) {
        emit(CustomerSuccessDeleteState());
      },
    );
  }

  FutureOr<void> _onCustomerUpdateEvent(
      CustomerUpdateEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerloadingState());

    final result = await updateCustomerUsecase.call(event.request);
    result.fold(
      (error) {
        emit(CustomerErrorState(error.toString()));
      },
      (success) {
        emit(CustomerSuccessUpdateState());
      },
    );
  }

  FutureOr<void> _onCustomerCreateEvent(
      CustomerCreateEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerloadingState());

    final result = await createCustomerUsecase.call(event.request);
    result.fold(
      (error) {
        emit(CustomerErrorState(error.toString()));
      },
      (success) {
        emit(CustomerSuccessCreateState());
      },
    );
  }
}
