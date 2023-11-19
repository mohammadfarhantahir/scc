

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TournamentPolicy extends StatefulWidget{
  State<TournamentPolicy> createState()=> TournamentPolicyState();
}

class TournamentPolicyState extends State<TournamentPolicy>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [

        Text('Policies',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'ShawBold',
          ),
        ),
        SizedBox(height: 20,),

        CachedNetworkImage(
          imageUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403x12.png',
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width,
        ),
        Text('For everyone’s safety and comfort.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'ShawBold',
          ),
        ),
        Container(
          width: 350,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/PolicyHomeScreen'); // Navigate to the


             // _launchSpectorGuideURL();
            },
            child: Text(
              'View Now',
              style: TextStyle(
                fontFamily: 'ShawBold',
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

      ],
    );
  }

}