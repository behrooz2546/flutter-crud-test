import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';

abstract class CustomerDatabaseService {
  Future<CustomerModel> insertCustomer(CustomerModel customer);
  Future<List<CustomerModel>> getAllCustomers();
  Future<CustomerModel?> getCustomer(int id);
  Future<int?> deleteCustomer(int id);
  Future<int?> updateCustomer(CustomerModel request);
}
