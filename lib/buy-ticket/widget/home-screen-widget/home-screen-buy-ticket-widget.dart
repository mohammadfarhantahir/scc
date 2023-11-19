

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Buytickethomescreen1 extends StatelessWidget{

  void _launchGeneralAdmission() async {
    const twitterUrl = 'https://www.showpass.com/e/general-admission-5/'; // Replace with your Twitter profile URL
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {

      throw 'Could not launch $twitterUrl';
    }
  }

  void _launchWeekly() async {
    const twitterUrl = 'https://www.showpass.com/m/general-admission/'; // Replace with your Twitter profile URL
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {

      throw 'Could not launch $twitterUrl';
    }
  }


  void _launchCanyon() async {
    const twitterUrl = 'https://www.showpass.com/m/canyon-club/ '; // Replace with your Twitter profile URL
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {

      throw 'Could not launch $twitterUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xff00AED9)
      ),
      child: Column(

        children: [
         Container(
           padding: EdgeInsets.all(12),
           child:  Text('Make it your experience and choose from a variety of ticket options!',
             style: TextStyle(
               color: Colors.white,
               fontFamily: 'ShawBold',
               fontSize: 24,
             ),
             textAlign: TextAlign.center,
           ),
         ),
          CachedNetworkImage(
            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/SCC_1200x600_ShowPass_LandingPage_General-Admission_MAY8%403x.png",
            imageBuilder: (context, imageProvider) => Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'Cannot load the image',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              _launchGeneralAdmission();
              print('single day clicked');
            },
            child: Container(
              width: 350,
             height: 50,
             // padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                  color: Colors.white
              ),
              child: Center(
                child: Text('Single Day',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'ShawBold',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              _launchWeekly();

            },
            child: Container(
              width: 350,
              height: 50,
              //padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                  color: Colors.white
              ),
              child: Center(
                child: Text('Weekly',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'ShawBold',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
          ),

          SizedBox(height: 50,),

          CachedNetworkImage(
            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/SCC_1200x600_ShowPass_LandingPage_Canyon-Club_MAY8%403x.png",
            imageBuilder: (context, imageProvider) => Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'Cannot load the image',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              _launchCanyon();

              print('Canyon cicked');

            },
            child: Container(
              width: 350,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                  color: Colors.white
              ),
              child: Text('Buy Now',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ShawBold',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),


          CachedNetworkImage(
            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/SCC_1200x600_ShowPass_LandingPage_Premium-Pass_MAY8%403x.png",
            imageBuilder: (context, imageProvider) => Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'Cannot load the image',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              _launchCanyon();

              print('Canyon cicked');

            },
            child: Container(
              width: 350,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                  color: Colors.white
              ),
              child: Text('Buy Now',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ShawBold',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      
    );
  }

}