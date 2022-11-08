import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entites/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class GetAllCustomersUsecase {
  final CustomerRepository repository;
  GetAllCustomersUsecase(this.repository);

  Future<Either<Failure, List<Customer>>> execute() async {
    return await repository.getAlls();
  }
}
