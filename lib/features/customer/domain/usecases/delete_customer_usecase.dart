import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/delete_customer_repository.dart';

class DeleteCustomerUsecase implements UseCase<bool, String> {
  final DeleteCustomerRepository repository;

  DeleteCustomerUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) {
    return repository.delete(id);
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
