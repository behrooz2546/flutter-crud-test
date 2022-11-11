import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/create_customer_usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer_usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/update_customer_usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer/customer_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'customer_form_bloc_test.mocks.dart';

@GenerateMocks([
  CreateCustomerUsecase,
  UpdateCustomerUsecase,
  DeleteCustomerUsecase,
  CustomerModel,
  CreateCustomerRequest,
  UpdateCustomerRequest,
])
void main() {
  late MockCreateCustomerUsecase createCustomerUsecase;
  late MockUpdateCustomerUsecase updateCustomerUsecase;
  late MockDeleteCustomerUsecase deleteCustomerUsecase;

  setUp(() {
    createCustomerUsecase = MockCreateCustomerUsecase();
    updateCustomerUsecase = MockUpdateCustomerUsecase();
    deleteCustomerUsecase = MockDeleteCustomerUsecase();
  });

  final model = MockCustomerModel();
  final createRequest = MockCreateCustomerRequest();
  final updateRequest = MockUpdateCustomerRequest();

  blocTest(
    'emits CustomerSuccessCreateState when CustomerCreateEvent is added',
    setUp: () {
      when(createCustomerUsecase.call(any))
          .thenAnswer((_) async => Right(model));
    },
    build: () => CustomerBloc(
      createCustomerUsecase: createCustomerUsecase,
      updateCustomerUsecase: updateCustomerUsecase,
      deleteCustomerUsecase: deleteCustomerUsecase,
    ),
    act: (bloc) => bloc.add(
      CustomerCreateEvent(createRequest),
    ),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      CustomerLoadingState(),
      CustomerSuccessCreateState(),
    ],
    verify: (bloc) {},
  );

  blocTest(
    'emits CustomerSuccessUpdateState when CustomerUpdateEvent is added',
    setUp: () {
      when(updateCustomerUsecase.call(any))
          .thenAnswer((_) async => Right(model));
    },
    build: () => CustomerBloc(
      createCustomerUsecase: createCustomerUsecase,
      updateCustomerUsecase: updateCustomerUsecase,
      deleteCustomerUsecase: deleteCustomerUsecase,
    ),
    act: (bloc) => bloc.add(
      CustomerUpdateEvent(updateRequest),
    ),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      CustomerLoadingState(),
      CustomerSuccessUpdateState(),
    ],
    verify: (bloc) {},
  );

  blocTest(
    'emits CustomerSuccessDeleteState when CustomerDeleteEvent is added',
    setUp: () {
      when(deleteCustomerUsecase.call(any))
          .thenAnswer((_) async => const Right(true));
      when(model.id).thenReturn(1);
    },
    build: () => CustomerBloc(
      createCustomerUsecase: createCustomerUsecase,
      updateCustomerUsecase: updateCustomerUsecase,
      deleteCustomerUsecase: deleteCustomerUsecase,
    ),
    act: (bloc) => bloc.add(
      CustomerDeleteEvent(model),
    ),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      CustomerLoadingState(),
      CustomerSuccessDeleteState(),
    ],
    verify: (bloc) {},
  );
}
