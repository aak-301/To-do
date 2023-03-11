// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void loggedIn() {
    emit(AuthenticationAuthenticated());
  }

  void loggedOut() {
    emit(AuthenticationUnAuthenticated());
  }
}
