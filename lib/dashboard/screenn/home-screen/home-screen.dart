


import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../../daily-pairing/screen/daily-pairing-home.dart';
import '../../../daily-pairing/widget/daily-pairing-with-api/daily-pairing-api-List.dart';
import '../../../leaderboard/screen/leaderboard-screen-new.dart';
import '../../../leaderboard/screen/leaderboard-screen.dart';
import '../../../spectator-guide/screen/spectator-guide.dart';
import '../../../spectator-guide/screen/spector-guide-screen-new.dart';
import '../../../spector-info/screen/home-sepctor-info.dart';
import '../../../spector-info/screen/home-spectator-information-new.dart';
import '../../widget/bottombar-screen/bottom-bar-screen.dart';
import '../../widget/featured-group-list/featured-group-list.dart';
import '../../widget/nav-drawer/nav-drawer.dart';
import '../../widget/sponsor-swipable-widgete/sponsor-swipable-widget.dart';
import '../../widget/swipe-card-widget/swipe-card-widget.dart';
import 'home-screen-advertisment-slider.dart';

class HomeScreennew extends StatefulWidget{
  State<HomeScreennew> createState()=> HomeScreenState();
}

class HomeScreenState extends State<HomeScreennew>{
  String? initImageUrl ;
  String labelText='';
  String firstbody='';
  String? coursemapurl;
  int _selectedIndex = -1;
  Timer? _fetchTimer; // Variable to hold the Timer
  String? _latestImageUrl;
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
  Future<void> _fetchinit() async {
    final apiUrl = 'https://raptorassistant.com:3344/home_dashboard/24';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData != null && jsonData.containsKey('top_poster_image_url')) {
          final latestImageUrlinit = jsonData['top_poster_image_url'];
          final coursemapimageurl = jsonData['home_course_map'];
          setState(() {
            initImageUrl = 'https://raptorassistant.com/shaw-charity-classic/assets/$latestImageUrlinit';
            coursemapurl = 'https://raptorassistant.com/shaw-charity-classic/assets/$coursemapimageurl';
            // print('image url is --> $initImageUrl');

            // Assuming the label text is fetched from jsonData as 'label_text'
            labelText = jsonData['first_heading']; // Replace 'label_text' with the actual key for the label text in your JSON data
            firstbody = jsonData['first_body'];

          });
        } else {
          print('Invalid JSON data or missing "top_poster_image_url" key.');
        }
      } else {
        print('Failed to fetch latest image. Error: ${response.body}');
      }
    } catch (error) {
      print('Error fetching latest image: $error');
    }
  }
  @override
  void initState() {
    super.initState();
    // Fetch the latest image URL when the screen is initialized
    _fetchinit();
    _scrollController.addListener(_scrollListener);

    // Start the periodic timer to fetch the latest image every 1 second
    _fetchTimer = Timer.periodic(Duration(seconds: 1), (_) => _fetchinit());
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
    // Dispose of the timer when the widget is removed from the widget tree
    _fetchTimer?.cancel();
    super.dispose();
  }

  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey, // Add the GlobalKey to the Scaffold
      drawer: Drawer(
        // Add your drawer content here
        child: NavDrawer()
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
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 370,
                        child: Stack(
                          children: [
                            // Check if initImageUrl is not null before loading the CachedNetworkImage
                            if (initImageUrl != null)
                              CachedNetworkImage(
                                imageUrl: initImageUrl!,
                                key: Key(initImageUrl!),
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            // Show a placeholder image or loading indicator while initImageUrl is null
                            if (initImageUrl == null)
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            Positioned(
                              top: 250,
                              child:Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(20),
                                height: 100,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Text(
                                    labelText,
                                    style: TextStyle(
                                      fontFamily: 'ShawBold',
                                      color: Colors.black,
                                      fontSize: 27,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      firstbody,
                      style: TextStyle(
                        fontFamily: 'ShawRegular',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {
                        print('clicked');
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyPairing()));
                        // Button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF01AED9),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Daily Pairings',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {
                        print('clicked');

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeaderBoardScreenNew()));

                        // Button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF01AED9),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Leaderboard',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {
                        print('clicked');
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpectorGuidenew()));

                        // Button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF01AED9),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Spectator Guide',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {
                        print('clicked');
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpectatorInformationNew()));


                        // Button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF01AED9),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Spectator Info',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Course Map',
                      style: TextStyle(
                        fontFamily: 'ShawBold',
                        color: Colors.black,
                        fontSize: 29,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      // Check if initImageUrl is not null before loading the CachedNetworkImage
                      if (coursemapurl != null)
                        Container(
                          padding: EdgeInsets.all(12),
                          child:  CachedNetworkImage(
                            imageUrl: coursemapurl!,
                            key: Key(coursemapurl!),
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                          ),
                        ),
                      // Show a placeholder image or loading indicator while initImageUrl is null
                      if (initImageUrl == null)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(12),

                    child: AdminSwipeCardWidget(),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff00AED9), // Background color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0), // Radius for top-left corner
                            topRight: Radius.circular(20.0), // Radius for top-right corner
                          ),
                        ),
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(16.0), // Optional padding
                        child: Center(
                          child: Text(
                            'Featured Groups',
                            style: TextStyle(
                              fontFamily: 'ShawBold',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 600,
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Color(0xFFCCCCCC),
                              borderRadius: BorderRadius.circular(12)),
                          child:GolfLeaderboardHomeScreen()
                      )
                    ],

                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyPairing()));
                        },
                        child: Text('View All',
                          style: TextStyle(
                              fontFamily: 'ShawBold',
                              color: Colors.black,
                              fontSize: 16
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child:  ResponsiveSliderHome(),
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
                    )

                )
            ):SizedBox()
          ]
      ),
    );
  }

}