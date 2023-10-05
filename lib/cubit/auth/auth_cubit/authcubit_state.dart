part of 'authcubit.dart';

sealed class AuthCubitState {}

final class AuthCubitCubitInitial extends AuthCubitState {}

final class LoginLoading extends AuthCubitState {}

final class LoginSuccess extends AuthCubitState {}

final class Loginfailure extends AuthCubitState {
  final String message;

  Loginfailure({required this.message});
}

final class SigninLoading extends AuthCubitState {}

final class SigninSuccess extends AuthCubitState {}

final class Signinfailure extends AuthCubitState {
  final String message;

  Signinfailure({required this.message});
}
