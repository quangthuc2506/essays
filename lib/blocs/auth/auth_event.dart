part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  SignUpEvent(this.fullName, this.email, this.password, this.phoneNumber,
      this.confirmPassword);
}

class SignOutEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class CheckedSignInEvent extends AuthEvent {
  final email;
  CheckedSignInEvent({this.email});
}

class LoadInforEvent extends AuthEvent {
  String? fullName;
  String? phoneNumber;
  LoadInforEvent({this.fullName, this.phoneNumber});
}

class UpdateNameEvent extends AuthEvent {
  String? fullName;
  UpdateNameEvent({this.fullName});
}

class UpdatePhoneNumberEvent extends AuthEvent {
  String? phoneNumber;
  UpdatePhoneNumberEvent({this.phoneNumber});
}

class UpdateAvatarEvent extends AuthEvent {}
