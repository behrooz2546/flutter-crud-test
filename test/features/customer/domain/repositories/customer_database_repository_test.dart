import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/config/constants.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_database_service_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'customer_database_repository_test.mocks.dart';

@GenerateMocks([
  CustomerDatabaseServiceImpl,
  CustomerModel,
  CreateCustomerRequest,
])
void main() {
  late Database database;
  late MockCustomerDatabaseServiceImpl databaseService;
  CustomerModel model = MockCustomerModel();
  CreateCustomerRequest request = CreateCustomerRequest(
    firstName: "testet",
    lastName: "tesaf",
    email: "asdad@gmail.com",
    bankAccountNumber: "asdasdasda",
    phoneNumber: "+345345345",
    dateOfBirth: DateTime.now(),
  );
  List<CustomerModel> models = List.generate(10, (index) => model);

  setUpAll(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await database.execute(databaseRules);
    databaseService = MockCustomerDatabaseServiceImpl();
    databaseService.db = database;
    when(databaseService.insertCustomer(any)).thenAnswer((_) async => model);
    when(databaseService.updateCustomer(any)).thenAnswer((_) async => 1);
    when(databaseService.deleteCustomer(any)).thenAnswer((_) async => 1);
    when(databaseService.getCustomer(any)).thenAnswer((_) async => model);
    when(databaseService.getAllCustomers()).thenAnswer((_) async => models);
  });

  group("Database Test", () {
    test('add Item to database', () async {
      var i = await database.insert(tableName, request.toMap());
      var p = await database.query(tableName);
      expect(p.length, i);
    });

    test('add three Items to database', () async {
      CustomerModel firstModel = CustomerModel(
        firstName: "Behrooz",
        lastName: "Azimifar",
        email: "test@gmail.com",
        bankAccountNumber: "1213sdf34321",
        phoneNumber: "+989158949161",
        dateOfBirth: DateTime.now(),
      );
      CustomerModel secondModel = CustomerModel(
        firstName: "Behrooz",
        lastName: "Azimifar",
        email: "test2@gmail.com",
        bankAccountNumber: "1213sdf34322",
        phoneNumber: "+989158949162",
        dateOfBirth: DateTime.now(),
      );
      CustomerModel thirdModel = CustomerModel(
        firstName: "Behrooz",
        lastName: "Azimifar",
        email: "test3@gmail.com",
        bankAccountNumber: "1213sdf34323",
        phoneNumber: "+989158949163",
        dateOfBirth: DateTime.now(),
      );
      await database.insert(tableName, firstModel.toMap());
      await database.insert(tableName, secondModel.toMap());
      await database.insert(tableName, thirdModel.toMap());
      var p = await database.query(tableName);
      expect(p.length, 4);
    });

    test('update first Item', () async {
      CustomerModel model = CustomerModel(
        firstName: "test",
        lastName: "Azimifar",
        email: "behrooz2546@gmail.com",
        bankAccountNumber: "1213sdf34324",
        phoneNumber: "+989158949160",
        dateOfBirth: DateTime.now(),
      );
      await database.update(
        tableName,
        model.toMap(),
        where: '$columnId = ?',
        whereArgs: [1],
      );
      var p = await database.query(tableName);
      expect(p.first[columnFirstName], "test");
    });

    test('delete the first Item', () async {
      await database.delete(tableName, where: '$columnId = ?', whereArgs: [1]);
      var p = await database.query(tableName);
      expect(p.length, 3);
    });
  });

  group("Service test", () {
    test("create customer", () async {
      verifyNever(databaseService.insertCustomer(request));
      expect(await databaseService.insertCustomer(request), model);
      verify(databaseService.insertCustomer(request)).called(1);
    });

    test("update customer", () async {
      verifyNever(databaseService.updateCustomer(model));
      expect(await databaseService.updateCustomer(model), 1);
      verify(databaseService.updateCustomer(model)).called(1);
    });

    test("delete customer", () async {
      verifyNever(databaseService.deleteCustomer(1));
      expect(await databaseService.deleteCustomer(1), 1);
      verify(databaseService.deleteCustomer(1)).called(1);
    });

    test("get customer", () async {
      verifyNever(databaseService.getCustomer(1));
      expect(await databaseService.getCustomer(1), model);
      verify(databaseService.getCustomer(1)).called(1);
    });

    test("get all customers", () async {
      verifyNever(databaseService.getAllCustomers());
      expect(await databaseService.getAllCustomers(), models);
      verify(databaseService.getAllCustomers()).called(1);
    });
  });
}
