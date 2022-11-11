import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'customer_list_bloc_test.mocks.dart';

@GenerateMocks([GetAllCustomersUsecase])
void main() {
  late MockGetAllCustomersUsecase usecase;

  setUp(() {
    usecase = MockGetAllCustomersUsecase();
  });

  final customers = CustomerModel.getAlls();

  blocTest(
    'emits CustomerListLoadedState when CustomerListLoadEvent is added',
    setUp: () {
      when(usecase.call(any)).thenAnswer((_) async => Right(customers));
    },
    build: () => CustomerListBloc(usecase),
    act: (bloc) => bloc.add(CustomerListLoadEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      CustomerListLoadingState(),
      CustomerListLoadedState(customers),
    ],
    verify: (bloc) {},
  );

  blocTest(
    'emits CustomerListErrorState when CustomerListLoadEvent is added',
    setUp: () {
      when(usecase.call(any)).thenAnswer((_) async => Left(DatabaseFailure()));
    },
    build: () => CustomerListBloc(usecase),
    act: (bloc) => bloc.add(CustomerListLoadEvent()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      CustomerListLoadingState(),
      CustomerListErrorState(),
    ],
    verify: (bloc) {},
  );
}
