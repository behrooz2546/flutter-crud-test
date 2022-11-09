import 'package:either_dart/either.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
