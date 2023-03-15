part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationAuthenticated extends AuthenticationState {}
class AuthenticationUnAuthenticated extends AuthenticationState {}
