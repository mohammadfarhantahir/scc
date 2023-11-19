

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';
import '../widget/course-map-download-button/download-map-button.dart';

class CourseMapScreen extends StatefulWidget{
  State<CourseMapScreen> createState()=> CourseMapScreenState();
}

class CourseMapScreenState extends State<CourseMapScreen>{
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
  ScrollController _scrollController = ScrollController();
  bool scrollstatus = true;
  void _launchTwitter() async {
    const twitterUrl = 'https://twitter.com/i/flow/login?redirect_after_login=%2FShawClassic'; // Replace with your Twitter profile URL
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

  void _launchFacebook() async {
    const facebookUrl = 'https://www.facebook.com/shawcharityclassic/?fref=ts'; // Replace with your Facebook profile URL
    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('In Built Browser not found'),
          duration: Duration(seconds: 1),
        ),
      );
      throw 'Could not launch $facebookUrl';
    }
  }

  void _launchInstagram() async {
    const instagramUrl = 'https://www.instagram.com/shawclassic/'; // Replace with your Instagram profile URL
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('In Built Browser not found'),
          duration: Duration(seconds: 1),
        ),
      );
      throw 'Could not launch $instagramUrl';
    }
  }

  void _scrollListener() {
    if (_scrollController.offset == 0) {
      print('SingleChildScrollView at its original position.');
      setState(() {
        scrollstatus = true;
      });
    } else {
      print('SingleChildScrollView is scrolling.');
      setState(() {

        scrollstatus = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
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
                            InkWell(
                              onTap: (){
                                _launchTwitter();
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
                                _launchFacebook();
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
                                _launchInstagram();
                              },
                              child: Image.network(
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 370,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/course-map%403x.png",
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
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Text(
                                    'Course Map',
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


                  CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Course%20Map%403x.png",
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
                        downloadImage(context,'https://raptorassistant.com/shaw-charity-classic/assets/Course%20Map%403x.png');
                      },
                      child: Text(
                        'Download Course Map',
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

