import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learner/app/authentication/controller/sign_in_controller.dart';
import 'package:learner/app/authentication/view/notifier/sign_in_notifier.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/app_button.dart';
import 'package:learner/common/widgets/text_widgets.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late SignInController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = SignInController(ref);
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  //tap login button
                  thirdPartyLogin(),
                  //or with email and password text
                  text14Normal(text: "Or use email account to login"),

                  SizedBox(height: 50.h),
                  //app text field
                  appTextField(
                    label: "Enter Your Email Address",
                    text: "Email",
                    borderRadius: 15.sp,
                    prefixIcon: Icons.person,
                    func: (value) {
                      ref
                          .read(signInNotifierProvider.notifier)
                          .onUserEmailChanged(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  //forgot password text
                  appTextField(
                    label: "Enter your password",
                    text: "Password",
                    borderRadius: 15.sp,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    func: (value) {
                      ref
                          .read(signInNotifierProvider.notifier)
                          .onUserPasswordChanged(value);
                    },
                  ),
                  SizedBox(height: 15.h),

                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    alignment: Alignment.centerLeft,
                    child: textUnderline(),
                  ),
                  SizedBox(height: 60.h),
                  //app login button
                  appButton(
                    buttonName: "Login",
                    width: 325.w,
                    height: 50.h,
                    ontap: () {
                      _controller.handlesignIn();
                    },
                  ),
                  SizedBox(height: 20.h),
                  //app register button
                  appButton(
                    ontap: () {
                      context.push('/signUp');
                    },
                    buttonName: "Register",
                    width: 325.w,
                    height: 50.h,
                    color: AppColors.primaryText,
                    isLogin: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
