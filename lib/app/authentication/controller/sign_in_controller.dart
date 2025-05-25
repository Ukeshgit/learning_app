import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/view/notifier/sign_in_notifier.dart';
import 'package:learner/common/widgets/pop_up_messages.dart';

class SignInController {
  WidgetRef ref;
  SignInController(this.ref);
  void handlesignIn() {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print("Exception is $e");
      toastMessage(msg: e.toString());
    }
  }
}
