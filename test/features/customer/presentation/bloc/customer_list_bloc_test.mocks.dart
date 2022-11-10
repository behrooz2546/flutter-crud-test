// Mocks generated by Mockito 5.3.2 from annotations
// in mc_crud_test/test/features/customer/presentation/bloc/customer_list_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:either_dart/either.dart' as _i3;
import 'package:mc_crud_test/core/error/failures.dart' as _i6;
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart'
    as _i7;
import 'package:mc_crud_test/features/customer/domain/repositories/get_customer_repository.dart'
    as _i2;
import 'package:mc_crud_test/features/customer/domain/usecases/get_all_customers_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetCustomerRepository_0 extends _i1.SmartFake
    implements _i2.GetCustomerRepository {
  _FakeGetCustomerRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetAllCustomersUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllCustomersUsecase extends _i1.Mock
    implements _i4.GetAllCustomersUsecase {
  MockGetAllCustomersUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetCustomerRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeGetCustomerRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.GetCustomerRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.CustomerModel>>> call(
          _i4.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.CustomerModel>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.CustomerModel>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.CustomerModel>>>);
}