import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/view/notifier/register_notifier.dart';

class SignUpController {
  WidgetRef ref;
  SignUpController({required this.ref});

  void handleSignUp() {
    var state = ref.watch(registerNotifierProvider);
    String name = state.userName;
    String email = state.userName;
    String password = state.password;
    String rePassword = state.rePassword;
    print("Your name is $name");
    print("Your email is $email");
    print("Your password is $password");
    print("Your re-password is $rePassword");
    if (state.password != state.rePassword) {
      print("Your password doesn't match");
    }
  }
}
