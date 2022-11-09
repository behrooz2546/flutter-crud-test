import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerModel>>> getAlls();
}
