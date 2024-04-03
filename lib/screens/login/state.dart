part of 'cubit.dart';

class LoginState {}

class InitState extends LoginState {}
class LoggingState extends LoginState {}
class SuccessState extends LoginState {}
class ErrorState extends LoginState {
  final String err;
  ErrorState({required this.err});
}
