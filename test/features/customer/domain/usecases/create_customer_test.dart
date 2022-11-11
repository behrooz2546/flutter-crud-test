import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/create_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/create_customer_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_customer_test.mocks.dart';

@GenerateMocks([
  CreateCustomerRepository,
  CustomerModel,
  CreateCustomerRequest,
])
void main() async {
  late CreateCustomerUsecase usecase;
  late MockCreateCustomerRepository repository;

  setUp(() {
    repository = MockCreateCustomerRepository();
    usecase = CreateCustomerUsecase(repository);
  });

  final customer = MockCustomerModel();
  final request = MockCreateCustomerRequest();

  test('should create customer from repository', () async {
    when(repository.createCustomer(any))
        .thenAnswer((_) async => Right(customer));
    final result = await usecase.call(request);

    expect(result, Right(customer));

    verify(repository.createCustomer(request));
    verifyNoMoreInteractions(repository);
  });

  tearDown(() {});
}
