import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/create_customer_repository.dart';

class CreateCustomerUsecase
    implements UseCase<CustomerModel, CreateCustomerRequest> {
  final CreateCustomerRepository repository;

  CreateCustomerUsecase(this.repository);

  @override
  Future<Either<Failure, CustomerModel>> call(CreateCustomerRequest request) {
    return repository.createCustomer(request);
  }
}
