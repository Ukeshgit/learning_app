import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learner/app/welcome/view/widgets/widget.dart';
import 'package:learner/common/widgets/text_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: PageView(
              children: [
                //first page
                appOnBoardingPage(
                  imagepath: "assets/images/reading.png",
                  title: "First See learning",
                  subtitle:
                      "Forgot about all paper all knowledge are in one learning",
                ),
                appOnBoardingPage(
                  imagepath: "assets/images/reading2.png",
                  title: "connect with everyone",
                  subtitle:
                      "Always keep in touch with your tutor and friends. Let's get connected",
                ),
                appOnBoardingPage(
                  imagepath: "assets/images/boy.png",
                  title: "Always fascinated learning",
                  subtitle:
                      "Anytime,anywhere. The time is at your discretion. So Study anywhere",
                ),
              ],
            ),
          ),

          // Positioned(bottom: 50, child: Text("Widget One")),
        ],
      ),
    );
  }
}
