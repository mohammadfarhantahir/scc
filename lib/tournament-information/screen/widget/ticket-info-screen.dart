import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../comman-nav-bar/comman-nav-bar.dart';
import '../../../dashboard/widget/nav-drawer/nav-drawer.dart';

class TicketInfoScreenDetail extends StatefulWidget {
  State<TicketInfoScreenDetail> createState() => TicketInfoScreenDetailState();
}

class TicketInfoScreenDetailState extends State<TicketInfoScreenDetail> {
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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
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
              controller: _scrollController, // Attach the ScrollController here
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
                              onTap: () {
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
                              onTap: () {
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
                                onTap: () {
                                  _launchInstagram();
                                },
                                child: Image.network(
                                  'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-instagram%403x.png',
                                  fit: BoxFit.contain,
                                  width: 30,
                                  height: 30,
                                )),
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
                            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/DJI_0032%403x.png",
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
                                    'Tournament Information',
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
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        'General Admission',
                        style: TextStyle(
                          fontFamily: 'ShawBold',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  height: 10,
                                  width: 10,
                                )),
                            Expanded(
                              flex: 9,
                              child: Text(
                                'Good Any One Day tickets purchased before 11:59 PM MT on Sunday, August 13th are only \$20 (+ GST/Fees)',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  height: 10,
                                  width: 10,
                                )),
                            Expanded(
                              flex: 9,
                              child: Text(
                                'Weekly Passes purchased before 11:59 PM MT on Sunday, August 13th are only \$50 (+ GST/Fees)',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 350,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Provides access to the grounds to catch the golf action, Juniors 12 and under are admitted FREE when accompanied by a ticketed adult.',
                          style: TextStyle(
                            fontFamily: 'ShawRegular',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  // ...

                  Container(
                    height: 350,
                    decoration: BoxDecoration(color: Color(0xff00AED9)),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Details',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 20),
                            Expanded( // Add Expanded widget here
                              child: Text(
                                'Good any one day',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 20),
                            Expanded( // Add Expanded widget here
                              child: Text(
                                'Single ticket valid on one day of ticket holders choosing',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 20),
                            Expanded( // Add Expanded widget here
                              child: Text(
                                'Limited quantities available',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 30),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(width: 20),
                            Expanded( // Add Expanded widget here
                              child: Text(
                                'Admission on the Pro-Am Days (Wednesday, August 16th and Thursday, August 17th) is FREE',
                                style: TextStyle(
                                  fontFamily: 'ShawRegular',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

// ...

                ],
              ),
            ),
            scrollstatus
                ? Positioned(
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
            )
                : SizedBox(),
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
