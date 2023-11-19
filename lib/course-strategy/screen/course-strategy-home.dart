import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  bool statusofcurrentindex = false;
  final List<String> pagetitleheadin1 =  ['HOLE 1', 'HOLE 2', 'HOLE 3', 'HOLE 4','HOLE 5', 'HOLE 6', 'HOLE 7', 'HOLE 8', 'HOLE 9', 'HOLE 10', 'HOLE 11', 'HOLE 12', 'HOLE 13','HOLE 14', 'HOLE 15', 'HOLE 16', 'HOLE 17', 'HOLE 18'];
  final List<String> pageyard= ['468 YD', '442 YD', '370 YD', '600 YD','165 YD', '384 YD', '469 YD', '440 YD', '205 YD', '421 YD','532 YD','206 YD','454 YD','163 YD','492 YD','184 YD','480 YD','585 YD'];
 final List<String> pageTitles = ['This long par 4 opening hole is the only hole on the course that is uphill. This dogleg right is an inviting opening hole with bunkers on the left side of the fairway, and one on the right that is very carriable to a green that slopes front to back, making it a great first test.',
    'This long, dogleg left par 4 puts a precision on the tee shot with bunkers left and right of the fairway. There is no time to rest after getting your ball in play. The second shot must clear a large front bunker, and steer clear of more sand back right. It’s arguably the hardest hole on the golf course.'
  ,'Another dogleg to the right, hole 3 is risk/reward. Players will choose to take a crack at driving the green or playing safe, leaving themselves with a short iron to a slightly elevated green. Definitely a birdie hole.',
    'The longest par 5 on the course is a three-shot hole for most players. A straight away tee shot leaves players negotiating bunkers some 150 yards from the green on their second shot. A precise drive is a must to have an opportunity to go for this dandy in two, setting up a birdie or par.',
    'Although it is not a long par 3, don’t let your guard down. Pin placement dictates everything on this green that has lots of undulation. Stay away from the large bunker front-left and birdies are gettable.',
    'This short dogleg right is another risk/reward that requires a well-placed drive. PGA TOUR Champions players will hit 4 irons to driver on this little gem. A tier in the middle of the green divides the slope of the green from middle to front and middle to back. The only hole on the course with no fairway bunkers.',
    'Arguably the strongest and hardest par 4 on the course, even a good drive can be penal with a fairway bunker left and of out bounds right. There is no time to relax once your tee shot is in play. The green is no walk in the park and difficult to hit. Pin placement is key. Hold on to your hat if the hole location is on the left side.',
    'Players will let driver rip on this long, straightaway 4 par. Tee shots must avoid the well-placed fairway bunker on the right. Sand is everywhere, guarding this three-level green loaded with undulation.',
    'The hardest par 3 on the score card requires players to hit a longer iron into one of the largest greens on the property that is surrounded with trouble. Bunkers frame the green left and right. More trouble looms with a water hazard right that pulls in any shot landing right of the green.',
    'Players will use a fairway wood or hybrid off the tee on this great par 4 to avoid the bunker on the left side of the fairway that doglegs to the right. Tee shots to the right side of the fairway will leave an unobstructed view of the green. A very good hole that places a premium on position from tee to green.',];
  final List<Color> pageColors = [Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),Color(0xff00AED9),];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> clickedStatus = List.filled(11, false); // Assuming you have 11 indexes (0 to 10)

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

  void handleButtonClicked(int index) {
    if (!clickedStatus[index]) {
      // If the button is not clicked before
      setState(() {
        clickedStatus[index] = true; // Mark the button as clicked
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      });
    }
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
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    _scrollController.addListener(_scrollListener);
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
             // physics: NeverScrollableScrollPhysics(), // Disable scrolling
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
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Center(
                                  child: Text(
                                    'Course Strategy',
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
                  Text(
                    'Canyon Meadows Golf & Country Club Calgary, AB Par: 35-35-70 Yardage: 7061 yds.',
                    style: TextStyle(
                      fontFamily: 'ShawRegular',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Choose a Hole',
                    style: TextStyle(
                      fontFamily: 'ShawBold',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),

                  Container(
                    // height: MediaQuery.of(context).size.height,
                      child:  Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    if (_pageController.page != null &&
                                        _pageController.page! > 0) {
                                      _pageController.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    height: 50,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print('clicked');
                                              //*- here i cannot jump to the index when i click on it

                                              print('selected index is-->'+index.toString());
                                              handleButtonClicked(index);
                                              /*if(index==0){

                                                print('clicked');


                                                statusofcurrentindex?_pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                ):SizedBox();
                                              }*/
                                             /* else if(index==1){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if (index==2){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else  if(index==3){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==4){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==5){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==6){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==7){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==8){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==9){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                              else if(index==10){
                                                _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }*/
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFF01AED9),
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(12),
                                              child: Text(
                                                'Hole ${index + 1}',
                                                style: TextStyle(
                                                  fontFamily: 'ShawBold',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                              ),
                              SizedBox(width: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    if (_pageController.page != null &&
                                        _pageController.page! < pageyard.length - 1) {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: pageyard.map((title) {
                              int index = pageyard.indexOf(title);
                              return Icon(
                                index == _currentPage ? Icons.circle : Icons.circle_outlined,
                                size: 12,
                                color: index == _currentPage ? Colors.black : Colors.grey,
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: pageyard.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Color(0xff00AED9),
                                  child: Column(
                                    children: [
                                      //-- here i want to show the text as per the page
                                      SizedBox(height: 30,),
                                      Text(pagetitleheadin1[index],
                                        style: TextStyle(
                                          fontFamily: 'ShawBold',
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,),
                                      SizedBox(height: 10,),
                                      Text(pageyard[index],
                                          style: TextStyle(
                                          fontFamily: 'ShawMedium',
                                          color: Colors.white,
                                          fontSize: 16,
                                      ),
                                        textAlign: TextAlign.center,
                                      ),
                                      CachedNetworkImage(
                                        imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Okeeheelee_eagle_benchcraft_hole1-edit%403x.png",
                                        imageBuilder: (context, imageProvider) => Container(
                                          height: 300,
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
                                      SizedBox(height: 10,),
                                      Text('Course Flyover',
                                        style: TextStyle(
                                            fontFamily: 'ShawRegular',
                                            color: Colors.white,
                                            fontSize: 16

                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      //-- show rendering error as
                                      SizedBox(height: 10,),
                                      CachedNetworkImage(
                                        imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Hole-1_screenshot%403x.png",
                                        imageBuilder: (context, imageProvider) => Container(
                                            height: 300,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain,
                                                //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage('https://raptorassistant.com/shaw-charity-classic/assets/3669227_motion_video_ic_slow_icon%403x.png'),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                        ),
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                      Text(
                                        'Overview',
                                        style: TextStyle(
                                          fontFamily: 'ShawBold',
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(pageTitles[index],
                                        style: TextStyle(
                                            fontFamily: 'ShawRegular',
                                            color: Colors.white,
                                            fontSize: 16

                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                        ],
                      )
                  ),


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

