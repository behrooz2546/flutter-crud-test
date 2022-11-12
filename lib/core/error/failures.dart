import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DatabaseFailure extends Failure {
  final String message;
  final int? code;

  DatabaseFailure(this.message, this.code);

  @override
  List<Object?> get props => [message, code];

  static unknowError() => DatabaseFailure("error", 0);

  @override
  String toString() {
    return message;
  }
}
