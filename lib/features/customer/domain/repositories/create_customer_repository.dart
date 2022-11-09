import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class CreateCustomerRepository {
  Future<Either<Failure, CustomerModel>> createCustomer(
      CreateCustomerRequest request);
}
