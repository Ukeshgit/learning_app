import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learner/app/authentication/notifier/sign_in_notifier.dart';
import 'package:learner/common/entities/user.dart';
import 'package:learner/common/utils/constants.dart';
import 'package:learner/common/utils/global_loader.dart';
import 'package:learner/common/widgets/pop_up_messages.dart';
import 'package:learner/global/global.dart';

class SignInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  WidgetRef ref;
  SignInController(this.ref);
  Future<void> handlesignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailController.text = email;
    passwordController.text = password;

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
    ref.read(apploaderProvider.notifier).setLoaderValue(true);
    print("0");
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('1');
      if (credentials.user == null) {
        toastMessage(msg: "User doesn't exist.");
      } else if (!credentials.user!.emailVerified) {
        toastMessage(msg: "You must verify your email address first");
      } else {
        toastMessage(msg: "Login successful!");
      }
      ref.read(apploaderProvider.notifier).setLoaderValue(false);

      var user = credentials.user!;
      print('2');
      if (user != null) {
        print('3');
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        print("Your display name is $displayName");
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        print("4");
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
      ref.read(apploaderProvider.notifier).setLoaderValue(false);
    } catch (e) {
      print(e);
      ref.read(apploaderProvider.notifier).setLoaderValue(false);
    }
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    //we need to talk  to server
    //have local storage
    try {
      //try to remember user info
      Global.storageService.setString(
        Appconstants.STORAGE_USER_PROFILE_KEY,
        "123",
      );
      Global.storageService.setString(Appconstants.STORAGE_USER_TOKEN_KEY, "");
      GoRouter.of(ref.context).go('/dashboard');
      //finally to route after saving the information
    } catch (e) {
      if (kDebugMode) {
        print("Error is ${e.toString()}");
      }
    }
    //redirect to new page
  }
}
