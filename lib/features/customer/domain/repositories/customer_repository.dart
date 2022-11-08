import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entites/customer.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getAlls();
}
