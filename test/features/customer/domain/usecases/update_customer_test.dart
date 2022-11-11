import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/update_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/update_customer_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_customer_test.mocks.dart';

@GenerateMocks([
  UpdateCustomerRepository,
  CustomerModel,
  UpdateCustomerRequest,
])
void main() async {
  late UpdateCustomerUsecase usecase;
  late MockUpdateCustomerRepository repository;

  setUp(() {
    repository = MockUpdateCustomerRepository();
    usecase = UpdateCustomerUsecase(repository);
  });

  final customer = MockCustomerModel();
  final request = MockUpdateCustomerRequest();

  test('should update customer from repository', () async {
    when(repository.updateCustomer(any))
        .thenAnswer((_) async => Right(customer));
    final result = await usecase.call(request);

    expect(result, Right(customer));

    verify(repository.updateCustomer(request));
    verifyNoMoreInteractions(repository);
  });

  tearDown(() {});
}
