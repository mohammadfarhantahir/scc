


import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';

class SpectatorGuidescreen extends StatefulWidget{
  State<SpectatorGuidescreen> createState()=> SpectatorGuidescreenState();
}

class SpectatorGuidescreenState extends State<SpectatorGuidescreen>{
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
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
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            navSVG,
                            fit: BoxFit.contain,
                          ),
                          onPressed: () {
                            print('clicked');
                          //  openDrawer();
                          },
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                           //   _launchTwitter();
                            },
                            child: Image.network(
                              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-twitter%403x.png',
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: (){
                            //  _launchFacebook();
                            },
                            child: Image.network(
                              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-facebook%403x.png',
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: (){
                             // _launchInstagram();
                            },
                            child:  Image.network(
                              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-instagram%403x.png',
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                  "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-26%20at%204.04.00%20PM.png",
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
                  bottom: MediaQuery.of(context).size.height / 1.7,
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
                        '2023 Spectator Guide',
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
                          decoration: BoxDecoration(
                            color: Color(0xff00AED9),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Text(
                              '2023 Course Map will be available soon',
                              style: TextStyle(
                                fontFamily: 'ShawBold',
                                color: Colors.white,
                                fontSize: 24,
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
                              border: Border.all(color: Colors.black),
                              color: Colors.white
                          ),
                          child: Text('View Spectator Guide',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl:
                          "https://raptorassistant.com/shaw-charity-classic/assets/Official%20Partner%20of%20the%20Shaw%20Charity%20Classic%20presented%20by%20Rogers%20%281%29%403x.png",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(12),
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
          bottomNavigationBar: CommonBottomNavigationBar(
            currentIndex: _currentIndex,
            onTabTapped: _onTabTapped,
            routeMap: {
              0: '/HomeScreennew',
              1: '/BuyticketScreen',
              2: '/LeaderboardScreen',
              3: '/CharityInformationDonation',
              // Add more routes if needed
            },
            context: context,
          ),
        )
    );
  }

}