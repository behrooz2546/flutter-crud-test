import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/datasources/update_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class CustomerDatabaseService {
  Future<CustomerModel> insertCustomer(CreateCustomerRequest request);
  Future<List<CustomerModel>> getAllCustomers();
  Future<CustomerModel?> getCustomer(String id);
  Future<int?> deleteCustomer(int id);
  Future<int?> updateCustomer(UpdateCustomerRequest request);
}
