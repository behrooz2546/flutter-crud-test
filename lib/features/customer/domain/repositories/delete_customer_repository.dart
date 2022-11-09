import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class DeleteCustomerRepository {
  Future<Either<Failure, bool>> delete(String id);
}
