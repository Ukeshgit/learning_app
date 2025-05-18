import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                Column(
                  children: [
                    Image.asset("assets/images/reading.png", fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: text24Normal(text: "First See learning"),
                    ),
                  ],
                ),

                Image.asset("assets/images/reading2.png"),
              ],
            ),
          ),

          Positioned(bottom: 50, child: Text("Widget One")),
          Positioned(
            top: 100,
            bottom: 10,

            child: Text("Widget Two", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
