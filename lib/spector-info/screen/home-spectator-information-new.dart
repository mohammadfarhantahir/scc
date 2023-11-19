import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';
import '../widget/expandable-cards/expandable-cards-spector.dart';
import '../widget/first-part/first-part-body.dart';
import '../widget/second-part/second-part-spector.dart';
import '../widget/spector-swipe-widget/spector-swipe-widget.dart';

class SpectatorInformationNew extends StatefulWidget {
  @override
  _SpectatorInformationNewState createState() =>
      _SpectatorInformationNewState();
}

class _SpectatorInformationNewState extends State<SpectatorInformationNew> {
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
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
                          Image.network(
                            "https://raptorassistant.com/shaw-charity-classic/assets/TAK20170902-31593159-e1612891980570%403x.png",
                            height: 300,
                            fit: BoxFit.cover,
                          ),

                          Positioned(
                            top: 240,
                            left: 0,
                            right: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8),
                                height: 100,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Text(
                                    'Spectator Information',
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
                 Column(
                   children: [

                     Container(
                       child: FirstPartBodySpectorinfo(),
                     ),
                     Container(
                       child: SwipingWidgetSpector(),
                     ),
                     Container(
                       decoration: BoxDecoration(color: Color(0xff01AED9)),
                       child: SecondPartSpector(),
                     ),
                     Container(
                       decoration: BoxDecoration(color: Color(0xff01AED9)),
                       child: ExpandableCardsColumn(),
                     ),
                   ],
                 )
                ],
              ),
            ),
            scrollstatus?Positioned(
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
            ):SizedBox(),
          ],
        ),
        bottomNavigationBar: CommonBottomNavigationBar(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
          routeMap: {
            0: '/dashboardScreen',
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

// ... (other code)
