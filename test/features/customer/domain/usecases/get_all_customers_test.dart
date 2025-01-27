import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_customers_test.mocks.dart';

@GenerateMocks([GetCustomerRepository])
void main() async {
  late GetAllCustomersUsecase usecase;
  late MockGetCustomerRepository repository;

  setUp(() {
    repository = MockGetCustomerRepository();
    usecase = GetAllCustomersUsecase(repository);
  });

  final allCustomers = CustomerModel.getAlls();

  test('should get all customers from repository', () async {
    when(repository.getAllCustomers())
        .thenAnswer((_) async => Right(allCustomers));
    final result = await usecase.call(NoParams());

    expect(result, Right(allCustomers));

    verify(repository.getAllCustomers());
    verifyNoMoreInteractions(repository);
  });

  tearDown(() {});
}
