import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/view/notifier/sign_in_notifier.dart';
import 'package:learner/common/widgets/pop_up_messages.dart';

class SignInController {
  WidgetRef ref;
  SignInController(this.ref);
  Future<void> handlesignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    print("Your email is $email");
    print("Your password is $password");

    if (state.email.isEmpty) {
      print("Your email is empty");
      toastMessage(msg: "Your email is empty");
      return;
    } else if (state.password.isEmpty) {
      print("Your password is empty");
      toastMessage(msg: "Your password is empty");
      return;
    } else if (!email.contains('@') || !email.contains('.')) {
      toastMessage(msg: 'Please enter a valid email address');
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credentials.user == null) {
        toastMessage(msg: "User doesn't exist.");
      } else if (!credentials.user!.emailVerified) {
        toastMessage(msg: "You must verify your email address first");
      } else {
        toastMessage(msg: "Login successful!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        toastMessage(msg: "Invalid email address.");
      } else if (e.code == 'user-disabled') {
        toastMessage(msg: "User has been disabled.");
      } else if (e.code == 'user-not-found') {
        toastMessage(msg: "No user found with this email.");
      } else if (e.code == 'wrong-password') {
        toastMessage(msg: "Incorrect password.");
      } else {
        toastMessage(msg: "Authentication failed. ${e.message}");
      }
    } catch (e) {
      toastMessage(msg: "An unexpected error occurred.");
    }
  }
}
