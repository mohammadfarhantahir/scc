

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreenNew extends StatefulWidget{
  State<WelcomeScreenNew> createState()=> WelcomeScreenNewState();
}

class WelcomeScreenNewState extends State<WelcomeScreenNew>{

  final logoSVG = 'assets/svg/logo/Logo.svg'; // Replace with your SVG image path
  final logoPath = 'assets/svg/welcome/logo_bg.svg';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://raptorassistant.com/shaw-charity-classic/assets/golf-ball-green-grass-with-hole-sunlight%403x.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:Stack(
              children: [
                Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/pathsvg.png",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 250,
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
                    )
                ),
                //#2
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child:Column(
                                      children: [
                                        SizedBox(height: 50,),
                                        Image.network(
                                          'https://raptorassistant.com/shaw-charity-classic/assets/Path%2071%403x.png',
                                        ),
                                      ],
                                    )
                                ),
                                Expanded(
                                    flex: 9,
                                    child:  Column(
                                      children: [
                                        SizedBox(
                                          height: 50,

                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.network(
                                            height:20,
                                            'https://raptorassistant.com/shaw-charity-classic/assets/Path%2065%403x.png',
                                          ),
                                        ),
                                        Image.network(
                                          height:200,
                                          'https://raptorassistant.com/shaw-charity-classic/assets/John%20Daly%403x.png',
                                        ),

                                        SizedBox()
                                      ],
                                    )
                                )
                              ],
                            )
                        ),
                        Expanded(
                            child: Column(
                              children: [

                                Container(
                                  height: 250, // Adjust the height of the second (middle) image container
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://raptorassistant.com/shaw-charity-classic/assets/Mike%20Weir%403x.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                            child:Row(
                              children: [
                                Expanded(
                                    flex: 9,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Image.network(
                                            'https://raptorassistant.com/shaw-charity-classic/assets/pathh.png',
                                            height: 20,
                                          ),
                                        ),

                                        Image.network(
                                          'https://raptorassistant.com/shaw-charity-classic/assets/Fred%20Couples%403x.png',
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Image.network(
                                            'https://raptorassistant.com/shaw-charity-classic/assets/Path%2065%403x.png',
                                            height: 10,
                                          ),
                                        ),
                                      ],
                                    )

                                ),
                                Expanded(
                                    flex:1,
                                    child:Column(
                                      children: [
                                        //  SizedBox(height: 50,),
                                        Image.network(
                                          'https://raptorassistant.com/shaw-charity-classic/assets/Path%2071%403x.png',
                                        ),
                                        SizedBox(height: 50,),
                                      ],
                                    )
                                ),

                              ],
                            )
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),

                    //--* read this carefully i want to show above #2 and below #3


                  ],
                ),


                //#3
                Positioned(
                  top: MediaQuery.of(context).size.height/1.4,
                    left: 0,
                    right: 0,
                    child:   Center(
                      child: Column(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,

                              ),
                              Text(
                                'Welcome to the ',
                                style: TextStyle(
                                  fontFamily: 'ShawBold',
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],

                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,

                              ),
                              Text(
                                'Shaw Charity Classic ',
                                style: TextStyle(
                                  fontFamily: 'ShawBold',
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],

                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,

                              ),
                              Text(
                                'Classic present by Rogers. ',
                                style: TextStyle(
                                  fontFamily: 'ShawBold',
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      print('clicked');
                                      Navigator.pushNamed(context, '/dashboardScreen'); // Navigate to the DashboardScreen
                                      // Button action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF01AED9), // Background color
                                      onPrimary: Colors.white, // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18), // Round corners
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        // width: 320,
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          'Explore the 2023 Tournament',
                                          style: TextStyle(
                                            fontFamily: 'ShawRegular',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            //fontSize: 24,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(height: 10,)
                              ],
                            )
                          ),

                        ],
                      ),
                    )
                ),

                Positioned(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: SvgPicture.asset(
                            logoSVG,
                            fit: BoxFit.fill,
                          ),
                        )
                    )
                ),

                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.network(
                            'https://raptorassistant.com/shaw-charity-classic/assets/Group%20644%403x.png',
                            width: 100,
                            height: 50,
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Image.network(
                            'https://raptorassistant.com/shaw-charity-classic/assets/Group%20660%403x.png',
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

        ),
    );
  }

}