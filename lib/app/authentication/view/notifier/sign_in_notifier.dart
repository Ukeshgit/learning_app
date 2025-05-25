import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/view/notifier/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() // this is for child class constructor
    : super(
        SignInState(),
      ); //super is used to initialize the constructor of parent class ie. statenotifier
  void onUserEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider = StateNotifierProvider((ref) {
  return SignInNotifier();
});
