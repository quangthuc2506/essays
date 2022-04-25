part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class LoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final Map<String, dynamic> userMap;
  AuthenticatedState({this.userMap = const {}});
}

class UnAuthenticatedState extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
