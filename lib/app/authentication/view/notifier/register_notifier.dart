import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'register_state.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return const RegisterState();
  }

  void onUserNameChanged(String name) {
    state = state.copyWith(userName: name);
  }

  void onUserEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onUserConfirmPasswordChanged(String confirmPassword) {
    state = state.copyWith(rePassword: confirmPassword);
  }
}
