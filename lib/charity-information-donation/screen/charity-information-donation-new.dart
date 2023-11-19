

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';

class CharityInformationAndDonation extends StatefulWidget{
  State<CharityInformationAndDonation> createState()=> CharityInformationAndDonationState();
}

class CharityInformationAndDonationState extends State<CharityInformationAndDonation>{
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

  void _launchDonate() async {
    const twitterUrl = 'https://shawcharityclassic.com/donatenow/'; // Replace with your Twitter profile URL
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

  void _launchJoinnow() async {
    const twitterUrl = 'https://shawcharityclassic.com/contact/'; // Replace with your Twitter profile URL
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
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
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
                                      'Charity Information & Donate',
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



                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Text('Our Cause',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            fontSize: 24
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child:  Text('Besides watching some of the best golfers compete in our province, our real drive is helping the kids who call Alberta home. Thanks to your support, we have raised over \$93 million dollars for over 270 children and youth charities across Alberta.',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawMedium',
                            fontSize: 16
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TK140828-821-1%403x.png",
                      imageBuilder: (context, imageProvider) => Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fitWidth,
                                colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.colorBurn)
                            ),
                          ),
                          child: Center(
                            child: Text('The Calgary Shaw Charity Classic Foundation is a registered charity, CRA number 827378977 RR0001',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ShawBold',
                                  fontSize: 18
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),

                      child: Text('All administrative costs and efforts for the program including website administration, credit card fees, invoicing, etc. will be covered by the Shaw Charity Classic tournament. This means that 100% of all funds donated through the program will go directly to your charity of choice. On top of the donation, the most exciting part of Birdies for Kids is the matching pool. For every generous contribution, the Calgary Shaw Charity Classic Foundation will match up to 50%.',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawMedium',
                            fontSize: 16
                        ),
                        textAlign: TextAlign.center,


                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        print('donate clicked');
                        _launchDonate();

                      },
                      child:  Container(
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black)
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(16),
                        child: Text('Donate Now',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              fontSize: 16
                          ),
                          textAlign: TextAlign.center,


                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      color: Color(0xff00AED9),
                      height: 700,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.all(30),
                            child: Text('Shaw Birdies for Kids presented by AltaLink',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ShawBold',
                                  fontSize: 24
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CachedNetworkImage(
                            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20170829-1724%403x.png",
                            imageBuilder: (context, imageProvider) => Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                  // colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.colorBurn)
                                ),
                              ),

                            ),
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Text('A non-profit program under the Calgary Shaw Charity Classic Foundation. This program is designed to help raise new funds for local charities, engage the community in the tournament, and provide matching funds for each charity involved.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'ShawMedium',
                                  fontSize: 16
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child:Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child:Text('You can donate online or by cheque between March 1 and August 31',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ShawMedium',
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child:Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child:Text('Donations can be made to the Shaw Charity Classic Foundation matching pool or directly to a participating charity',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ShawMedium',
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child:Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child:Text('Donations directed to a participating charity are matched up to 50% using the Foundation matching pool',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ShawMedium',
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child:Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child:Text('All administrative costs are covered by the tournament, meaning 100% of all donations will go directly to the charity selected.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'ShawMedium',
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text('Become a Participating Charity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'ShawBold',
                                  fontSize: 24
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('The 2023 application process is now closed.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'ShawMedium',
                                  fontSize: 16
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                    ),
                    InkWell(
                      onTap: (){

                        _launchJoinnow();
                      },
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black)
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(16),
                        child: Text('Get In Touch',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              fontSize: 16
                          ),
                          textAlign: TextAlign.center,


                        ),
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