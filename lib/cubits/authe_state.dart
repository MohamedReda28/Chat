part of 'authe_cubit.dart';

@immutable
abstract class AutheState {}

final class AutheInitial extends AutheState {}

class LoginInitial extends AutheState {}
class loginloading extends AutheState {}
class loginsuccess extends AutheState {}
class loginfailuer extends AutheState {
  String errorMassege;
  loginfailuer({required this.errorMassege});

  }


class RegisterInitial extends AutheState {}

class regsterLoading extends AutheState{}
class regsterSuccess extends AutheState{}
class regsterFailuer extends AutheState{
  String errormassege;
  regsterFailuer({required this.errormassege});
}

