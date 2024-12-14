part of 'auth_bluc_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthBlucInitial extends AuthState {}

class LoginInitial extends AuthState {}
class loginloading extends AuthState {}
class loginsuccess extends AuthState {}
class loginfailuer extends AuthState {
  String errorMassege;
  loginfailuer({required this.errorMassege});

}


class RegisterInitial extends AuthState {}

class regsterLoading extends AuthState{}
class regsterSuccess extends AuthState{}
class regsterFailuer extends AuthState{
  String errormassege;
  regsterFailuer({required this.errormassege});
}
