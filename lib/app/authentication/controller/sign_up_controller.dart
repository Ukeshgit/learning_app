import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/authentication/controller/register_notifier.dart';
import 'package:learner/common/repo/sign_up_repo.dart';
import 'package:learner/common/utils/global_loader.dart';
import 'package:learner/common/widgets/pop_up_messages.dart';

class SignUpController {
  WidgetRef ref;
  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.watch(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
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
      return;
    } else if (state.email.isEmpty) {
      print("Your email is empty");
      toastMessage(msg: "Your email is empty");
      return;
    } else if (state.password.isEmpty) {
      print("Your password is empty");
      toastMessage(msg: "Your password is empty");
      return;
    } else if (state.rePassword.isEmpty) {
      print("Your re-password is empty");
      toastMessage(msg: "Your re-password is empty");
      return;
    } else if (state.password != state.rePassword) {
      print("Your password doesn't match");
      toastMessage(msg: "Your passworddoesn't match");
      return;
    } else if (!email.contains('@') || !email.contains('.')) {
      toastMessage(msg: 'Please enter a valid email address');
      return;
    }

    //show the loading icon
    ref.read(apploaderProvider.notifier).setLoaderValue(true);
    Future.delayed(Duration(seconds: 2), () async {
      try {
        var credentials = await SignUpRepo.signUp(email, password);
        print(credentials.user!.uid);
        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(name);
          // get server photo url
          // set server photo url
          toastMessage(
            msg:
                "An email has been sent to verify your account. Please check your inbox.",
          );
          Navigator.pop(ref.context);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          toastMessage(msg: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          toastMessage(msg: 'The account already exists for that email.');
        } else if (e.code == 'invalid-email') {
          toastMessage(msg: 'The email address is not valid.');
        }
      } catch (e) {
        print(e);
        toastMessage(msg: e.toString());
      }
      //show the register page
      ref.read(apploaderProvider.notifier).setLoaderValue(false);
    });
  }
}
