import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/view/notifier/register_notifier.dart';
import 'package:learner/common/widgets/pop_up_messages.dart';

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

    if (state.userName.isEmpty) {
      print("Your name is empty");
      toastMessage(msg: "Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastMessage(msg: "Your name is too short");
    } else if (state.email.isEmpty) {
      print("Your email is empty");
      toastMessage(msg: "Your email is empty");
    } else if (state.password.isEmpty) {
      print("Your password is empty");
      toastMessage(msg: "Your password is empty");
    } else if (state.rePassword.isEmpty) {
      print("Your re-password is empty");
      toastMessage(msg: "Your re-password is empty");
    } else if (state.password != state.rePassword) {
      print("Your password doesn't match");
      toastMessage(msg: "Your passworddoesn't match");
    }
  }
}
