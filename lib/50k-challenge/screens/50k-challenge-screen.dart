

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiftykChallengeScreen extends StatefulWidget{
  State<FiftykChallengeScreen> createState()=> FiftykChallengeScreenState();
}

class FiftykChallengeScreenState extends State<FiftykChallengeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                  "https://raptorassistant.com/shaw-charity-classic/assets/Putting%20Challenge%20Photo%403x.png",
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
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
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
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 1.8,
                  left: 70,
                  right: 70,
                  child: Container(
                    height: 70,
                    constraints: BoxConstraints(
                      maxWidth: 150,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        'Rogers \$50K Putting Challenge',
                        style: TextStyle(
                          fontFamily: 'ShawBold',
                          color: Colors.black,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                // Enable vertical scrolling for this section
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.7,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(12),
                          height: 300,

                          child: Center(
                            child: Text(
                              'Energy Fan Zone presented by Atypique, participants have the chance to win 2 round trip tickets to anywhere Delta Airlines flies and \$50K in donations to a Shaw Birdies for Kids presented by AltaLink charity of your choice. Take your shot at a very long putt and you could find yourself at the top of the leaderboard with a chance to compete in the Final Round!',
                              style: TextStyle(
                                fontFamily: 'ShawRegular',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),


                        SizedBox(height: 10,),
                        Container(
                          width: 350,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                             // border: Border.all(color: Colors.black),
                             // color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00AED9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),

                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PLAYER',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawBold',
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('DISTANCE TO PIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawBold',
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 350,

                                child: Column(
                                  children: [
                                    for (int index = 0; index < 5; index++)
                                      Column(
                                        children: [
                                          ListTile(
                                            //title: Text(itemList[index]),
                                            // Set the background color based on the index (even or odd)
                                            tileColor: index % 2 == 0 ? Colors.white : Colors.grey[300],
                                          ),
                                          if (index < 5 - 1) // Add a divider unless it's the last item
                                            Divider(
                                              height: 1,
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                        ],
                                      ),
                                  ],
                                )
                              )
                      ]
                        ),

                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: kToolbarHeight - 65,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 90,
                    width: 90,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://raptorassistant.com/shaw-charity-classic/assets/Path%2058%403x.png',
                          fit: BoxFit.contain,
                        ),
                        Image.network(
                          'https://raptorassistant.com/shaw-charity-classic/assets/Logo%403x.png',
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}