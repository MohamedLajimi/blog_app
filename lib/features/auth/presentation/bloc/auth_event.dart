part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const AuthSignUp(this.name, this.email, this.password);
}

final class AuthSignIn extends AuthEvent {
  final String email;
  final String password;
  const AuthSignIn(this.email, this.password);
}

final class AuthUserIsLoggedIn extends AuthEvent{}
