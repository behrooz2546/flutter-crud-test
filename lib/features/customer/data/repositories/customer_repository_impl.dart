import 'package:either_dart/src/either.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/data/datasources/create_customer_request.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/create_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_database_service.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/delete_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/update_customer_repository.dart';
import 'package:sqflite/src/exception.dart';

class CustomerRepositoryImpl
    implements
        GetCustomerRepository,
        CreateCustomerRepository,
        UpdateCustomerRepository,
        DeleteCustomerRepository {
  final CustomerDatabaseService databaseService;

  CustomerRepositoryImpl(this.databaseService);

  @override
  Future<Either<Failure, CustomerModel>> createCustomer(
      CreateCustomerRequest request) async {
    try {
      final customer = await databaseService.insertCustomer(request);
      return customer != null
          ? Right(customer)
          : Left(DatabaseFailure.unknowError());
    } on SqfliteDatabaseException catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure(error.message ?? "", error.getResultCode()));
    } catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure.unknowError());
    }
  }

  @override
  Future<Either<Failure, bool>> delete(String id) async {
    try {
      final result = await databaseService.deleteCustomer(int.parse(id));
      return result != null
          ? const Right(true)
          : Left(DatabaseFailure("error", 0));
    } on SqfliteDatabaseException catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure(error.message ?? "", error.getResultCode()));
    } catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure.unknowError());
    }
  }

  @override
  Future<Either<Failure, List<CustomerModel>>> getAllCustomers() async {
    try {
      final customers = await databaseService.getAllCustomers();
      return Right(customers);
    } on SqfliteDatabaseException catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure(error.message ?? "", error.getResultCode()));
    } catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure.unknowError());
    }
  }

  @override
  Future<Either<Failure, CustomerModel>> getSingleCustomer(String id) {
    // TODO: implement getSingleCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomerModel>> updateCustomer(
      CustomerModel request) async {
    try {
      final id = await databaseService.updateCustomer(request);
      return id != null ? Right(request) : Left(DatabaseFailure.unknowError());
    } on SqfliteDatabaseException catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure(error.message ?? "", error.getResultCode()));
    } catch (error) {
      debugPrint(error.toString());
      return Left(DatabaseFailure.unknowError());
    }
  }
}
