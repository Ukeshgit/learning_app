import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(child: PageView(children: [Text("data"), Text("data")])),
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
