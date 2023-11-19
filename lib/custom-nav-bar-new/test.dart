import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawcharityclassicfinal/custom-nav-bar-new/screen/custom-navbar.dart';

class Test extends StatefulWidget {
  State<Test> createState() => TestState();
}

class TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch body to fill width
          children: [
            Expanded( // Wrap CustomNavBar with Expanded
              child: CustomNavBar(),
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.orange,
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12),
          child: CustomNavBar(),
        ),
      ),
    );
  }
}
