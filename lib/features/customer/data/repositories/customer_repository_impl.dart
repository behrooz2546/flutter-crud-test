import 'package:either_dart/src/either.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  @override
  Future<Either<Failure, List<CustomerModel>>> getAlls() {
    return CustomerModel.getAlls();
  }
}
