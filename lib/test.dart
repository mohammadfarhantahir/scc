


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom-nav-bar-new/screen/custom-navbar.dart';


class Test extends StatefulWidget{
  State<Test> createState()=> TestState();
}

class TestState extends State<Test>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: Column(),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(12),
            child: CustomNavBar(),
          ),
        )
    );
  }

}