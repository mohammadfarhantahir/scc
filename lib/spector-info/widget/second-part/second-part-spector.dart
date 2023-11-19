

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../expandable-cards/expandable-cards-spector.dart';

class SecondPartSpector extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 10,),
        Text('Spectator Tips',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: 'ShawBold',
          ),
        ),
        SizedBox(height: 10,),
        Text('We want to make sure you have the best time, which means planning ahead. Besides packing a hat and sunscreen, here are a few other things you should know before you arrive.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'ShawRegular',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10,),

      ],
    );
  }

}