import 'package:either_dart/src/either.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/create_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/delete_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/update_customer_repository.dart';

class CustomerRepositoryImpl
    implements
        GetCustomerRepository,
        CreateCustomerRepository,
        UpdateCustomerRepository,
        DeleteCustomerRepository {
  @override
  Future<Either<Failure, CustomerModel>> createCustomer(
      CreateCustomerRequest request) {
    // TODO: implement createCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CustomerModel>>> getAllCustomers() {
    return CustomerModel.getAlls();
  }

  @override
  Future<Either<Failure, CustomerModel>> getSingleCustomer(String id) {
    // TODO: implement getSingleCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomerModel>> updateCustomer(
      UpdateCustomerRequest request) {
    // TODO: implement updateCustomer
    throw UnimplementedError();
  }
}
