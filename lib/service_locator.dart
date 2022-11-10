import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_database_service_impl.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_database_service.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_list/customer_list_bloc.dart';

// ServiceLocator
final sl = GetIt.instance;

Future<void> init() async {
  // blocs --> Factory
  sl.registerFactory<CustomerListBloc>(() => CustomerListBloc(sl()));

  // UseCases --> LazySingleton
  sl.registerLazySingleton(() => GetAllCustomersUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<GetCustomerRepository>(
      () => CustomerRepositoryImpl(sl()));

  // DatabaseService
  final databaseService = CustomerDatabaseServiceImpl();
  await databaseService.initialize();
  sl.registerLazySingleton<CustomerDatabaseService>(() => databaseService);
}
