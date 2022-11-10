import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart';

class GetAllCustomersUsecase implements UseCase<List<CustomerModel>, NoParams> {
  final GetCustomerRepository repository;

  GetAllCustomersUsecase(this.repository);

  @override
  Future<Either<Failure, List<CustomerModel>>> call(NoParams params) async {
    final customers = await repository.getAllCustomers();
    return customers;
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
