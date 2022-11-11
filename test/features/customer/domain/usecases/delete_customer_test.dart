import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/delete_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_customer_test.mocks.dart';

@GenerateMocks([
  DeleteCustomerRepository,
  CustomerModel,
])
void main() async {
  late DeleteCustomerUsecase usecase;
  late MockDeleteCustomerRepository repository;

  setUp(() {
    repository = MockDeleteCustomerRepository();
    usecase = DeleteCustomerUsecase(repository);
  });

  final customer = MockCustomerModel();

  test('should create customer from repository', () async {
    when(repository.delete(any)).thenAnswer((_) async => const Right(true));
    final result = await usecase.call("1");

    expect(result, const Right(true));

    verify(repository.delete("1"));
    verifyNoMoreInteractions(repository);
  });

  tearDown(() {});
}
