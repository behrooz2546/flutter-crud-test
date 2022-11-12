import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/update_customer_repository.dart';

class UpdateCustomerUsecase implements UseCase<CustomerModel, CustomerModel> {
  final UpdateCustomerRepository repository;

  UpdateCustomerUsecase(this.repository);

  @override
  Future<Either<Failure, CustomerModel>> call(CustomerModel request) {
    return repository.updateCustomer(request);
  }
}
