

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';

class SpectorGuidenew extends StatefulWidget{
  State<SpectorGuidenew> createState()=> SpectorGuidenewState();
}

class SpectorGuidenewState extends State<SpectorGuidenew>{
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _launchSpectorGuideURL() async {
    const twitterUrl = 'https://7c1e077b.flowpaper.com/ShawCharityClassic2022/#page=1'; // Replace with your Twitter profile URL
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('In Built Browser not found'),
          duration: Duration(seconds: 1),
        ),
      );
      throw 'Could not launch $twitterUrl';
    }
  }

  @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
          key: _scaffoldKey, // Add the GlobalKey to the Scaffold
          drawer: Drawer(
            // Add your drawer content here
            child: NavDrawer(),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
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
                                openDrawer();
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-twitter%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-facebook%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-instagram%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 370,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-26%20at%204.04.00%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Positioned(
                              top: 270,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(8),
                                  height: 50,
                                  width: 350,
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
                            ),

                          ],
                        ),
                      ),
                    ),


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
                          _launchSpectorGuideURL();
                        },
                        child: Text(
                          'View Spectator Guide',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
              Positioned(
                top: kToolbarHeight - 65, // Adjust the offset to position the widget properly
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
        ),
    );
  }

}