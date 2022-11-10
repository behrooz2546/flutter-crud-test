import 'package:mc_crud_test/config/constants.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class CustomerDatabaseServiceImpl implements CustomerDatabaseService {
  late Database db;

  static final CustomerDatabaseServiceImpl _singleton =
      CustomerDatabaseServiceImpl._internal();

  factory CustomerDatabaseServiceImpl() {
    return _singleton;
  }

  CustomerDatabaseServiceImpl._internal();

  @override
  Future<void> initialize() async {
    String dbPath = p.join(await getDatabasesPath(), "test.db");
    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        return await db.execute(databaseRules);
      },
    );
  }

  @override
  Future<int?> deleteCustomer(int id) async {
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  @override
  Future<List<CustomerModel>> getAllCustomers() async {
    var customers = await db.rawQuery('SELECT * FROM $tableName');

    return List<CustomerModel>.from(
        customers.map((e) => CustomerModel.fromMap(e)));
  }

  @override
  Future<CustomerModel?> getCustomer(int id) async {
    List<Map> maps = await db.query(tableName,
        columns: [
          columnId,
          columnFirstName,
          columnLastName,
          columnDateOfBirth,
          columnEmail,
          columnBankAccountNumber,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return CustomerModel.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<CustomerModel> insertCustomer(CustomerModel customer) async {
    customer.id = await db.insert(tableName, customer.toJson());
    return customer;
  }

  @override
  Future<int?> updateCustomer(CustomerModel customer) async {
    return await db.update(tableName, customer.toMap(),
        where: '$columnId = ?', whereArgs: [customer.id]);
  }

  Future close() async => db.close();
}
