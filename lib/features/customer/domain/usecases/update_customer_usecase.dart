import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/update_customer_repository.dart';

class UpdateCustomerUsecase
    implements UseCase<CustomerModel, UpdateCustomerRequest> {
  final UpdateCustomerRepository repository;

  UpdateCustomerUsecase(this.repository);

  @override
  Future<Either<Failure, CustomerModel>> call(UpdateCustomerRequest request) {
    return repository.updateCustomer(request);
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
