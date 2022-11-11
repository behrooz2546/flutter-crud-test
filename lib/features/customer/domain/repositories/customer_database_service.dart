import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class CustomerDatabaseService {
  Future<void> initialize();
  Future<CustomerModel?> insertCustomer(CreateCustomerRequest customer);
  Future<List<CustomerModel>> getAllCustomers();
  Future<CustomerModel?> getCustomer(int id);
  Future<int?> deleteCustomer(int id);
  Future<int?> updateCustomer(CustomerModel request);
}
