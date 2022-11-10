import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart';

part 'customer_list_event.dart';
part 'customer_list_state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final GetAllCustomersUsecase usecase;

  CustomerListBloc(this.usecase) : super(CustomerListInitial()) {
    on<CustomerListLoadEvent>(_onCustomerListLoadEvent);
  }

  FutureOr<void> _onCustomerListLoadEvent(
      CustomerListLoadEvent event, Emitter<CustomerListState> emit) async {
    emit(CustomerListLoadingState());

    final result = await usecase.call(NoParams());
    result.fold(
      (error) {
        emit(CustomerListErrorState());
      },
      (customers) {
        emit(CustomerListLoadedState(customers));
      },
    );
  }
}
