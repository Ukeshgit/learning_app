import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learner/app/authentication/controller/sign_up_controller.dart';
import 'package:learner/app/authentication/view/notifier/register_notifier.dart';
import 'package:learner/app/authentication/view/widgets/sign_in_widgets.dart';
import 'package:learner/common/utils/app_colors.dart';
import 'package:learner/common/widgets/app_button.dart';
import 'package:learner/common/widgets/text_widgets.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late SignUpController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = SignUpController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regPro    vider.
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: buildAppBar(text: "Sign Up"),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  //or with email and password text
                  text14Normal(
                    text: "Enter the details below and free sign up",
                  ),

                  SizedBox(height: 40.h),
                  //app text field
                  appTextField(
                    label: "Enter Your User Name",
                    text: "User Name",
                    borderRadius: 15.sp,
                    prefixIcon: Icons.person,
                    func: (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserNameChanged(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  appTextField(
                    label: "Enter Your Email Address",
                    text: "Email",
                    borderRadius: 15.sp,
                    prefixIcon: Icons.person,
                    func: (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
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
                          .read(registerNotifierProvider.notifier)
                          .onUserPasswordChanged(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  appTextField(
                    label: "Enter your confirm password",
                    text: "Confirm Password",
                    borderRadius: 15.sp,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    func: (value) {
                      ref
                          .read(registerNotifierProvider.notifier)
                          .onUserConfirmPasswordChanged(value);
                    },
                  ),
                  SizedBox(height: 15.h),

                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    alignment: Alignment.centerLeft,
                    child: text14Normal(
                      text:
                          "By signing up you agree with our   \nTerms of Service and Privacy Policy",
                      color: AppColors.primarySecondaryElementText,
                    ),
                  ),
                  SizedBox(height: 60.h),
                  //app login button
                  appButton(
                    buttonName: "Register",
                    width: 325.w,
                    height: 50.h,
                    ontap: () {
                      _controller.handleSignUp();
                      context.push('/home');
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
