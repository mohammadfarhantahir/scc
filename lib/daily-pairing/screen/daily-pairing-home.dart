import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widget/daily-pairing-with-api/daily-pairing-api-List.dart';

class DailyPairing extends StatefulWidget {
  State<DailyPairing> createState() => DailyPairingState();
}

class DailyPairingState extends State<DailyPairing> {
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

  Map<String, dynamic> leaderboardData = {};

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Start refreshing the data every one second

  }

  Widget _buildLeaderboardListView() {
    if (leaderboardData.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final List<dynamic> players = leaderboardData['players'];

    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          title: Text(player['name']),
          subtitle: Text(
              'Rank: ${player['rank']}, Points: ${player['points']}'),
        );
      },
    );

}




@override
  Widget build(BuildContext context) {
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
                              onTap: (){
                                _launchTwitter();
                              },
                              child:  Image.network(
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
                            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/9-PGA-TOUR-WINNERS-COMMIT-4%403x.png",
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
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(8),
                                height: 50,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Text(
                                    'Daily Pairings',
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
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.all(10),

                    height: MediaQuery.of(context).size.height,
                    child: GolfLeaderboardScreen(),
                  )

                ],
              ),
            ),
            scrollstatus?Positioned(
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
            ):SizedBox(),
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
