

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TourCourse extends StatelessWidget{

  final String _url = 'https://shawcharityclassic.com/'; // Replace with the desired URL

  void _launchURL() async {
    const url = 'https://shawcharityclassic.com/';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
   /* const url = 'https://shawcharityclassic.com';
    if (!await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {

      throw 'Could not launch $url';
    }*/
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Course',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'ShawBold',
          ),
        ),
        CachedNetworkImage(
          imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403xCourse.png",
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
                //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
              ),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text('Canyon Meadows Golf & Country Club',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: 'ShawRegular',
          ),
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: (){
            _launchURL();
          },
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(8),
            height: 40,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Text('Visit Website',
              style: TextStyle(
                  fontFamily: 'ShawBold',
                  color: Colors.black,
                  fontSize: 16

              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

}