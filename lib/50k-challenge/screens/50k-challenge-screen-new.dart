


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../comman-nav-bar/custom-nav-bar-new.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';

class FiftKchallengeScreenNew extends StatefulWidget{
  State<FiftKchallengeScreenNew> createState()=> FiftKchallengeScreenNewState();
}

class FiftKchallengeScreenNewState extends State<FiftKchallengeScreenNew>{
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;


  final _inactiveColor = Colors.grey;
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }


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
  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,

        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ], iconUrl: [
        'https://raptorassistant.com/shaw-charity-classic/assets/9-Home%403x.png',
      'https://raptorassistant.com/shaw-charity-classic/assets/ticket%403x.png',
      'https://raptorassistant.com/shaw-charity-classic/assets/Layer%202%403x.png',
      'https://raptorassistant.com/shaw-charity-classic/assets/money%403x.png'
    ],
    );
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
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Putting%20Challenge%20Photo%403x.png",
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
                              top: 240,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(8),
                                  height: 100,
                                  width: 350,
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
                            ),

                          ],
                        ),
                      ),
                    ),


                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(12),

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
          bottomNavigationBar: _buildBottomBar()
        )
    );
  }

}