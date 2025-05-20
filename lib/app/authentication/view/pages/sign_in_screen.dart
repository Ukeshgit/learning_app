import 'package:flutter/material.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/common/widgets/text_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Container(
            child: Column(
              children: [
                //tap login button
                thirdPartyLogin(),
                //or with email and password text
                text14Normal(text: "Or use email account to login"),
                //app text field
                appTextField("d"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
