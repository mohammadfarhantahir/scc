import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
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
  int _selectedIndex = -1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/dashboardScreen'); // Navigate to the

      }
      if(_selectedIndex==1){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/tournamentScreen'); // Navigate to the
      }
      else if(_selectedIndex==2){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/spectorScreen'); // Navigate to the
      }
      else if(_selectedIndex==3){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/courseScreen'); // Navigate to the

      }
      else if(_selectedIndex==4){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/DailyPairing'); // Navigate to the


      }
      else if(_selectedIndex==5){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/LeaderboardScreen'); // Navigate to the

      }
      else if(_selectedIndex==6){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/CourseMapScreen'); // Navigate to the


      }
      else if(_selectedIndex==7){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/CharityInformationDonation'); // Navigate to the


      }
      else if(_selectedIndex==8){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/SponsorScreen'); // Navigate to the


      }

      else if(_selectedIndex==9){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/BuyticketScreen'); // Navigate to the


      }
      else if(_selectedIndex==10){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/SpectatorGuidescreen'); // Navigate to the


      }
      else if(_selectedIndex==11){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/FiftykChallengeScreen'); // Navigate to the


      }
      else if(_selectedIndex==12){
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/PromotionScreen'); // Navigate to the

      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/9-Home%403x.png',
        'title': 'Home',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20863%403x.png',
        'title': 'Tournament Information',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/9-Home%403x.png',
        'title': 'Spectator Info',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20865%403x.png',
        'title': 'Course Strategy',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20871%403x.png',
        'title': 'Daily Pairings',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Layer%202%403x.png',
        'title': 'Leaderboard',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20874%403x.png',
        'title': 'Course Map',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/money%403x.png',
        'title': 'Charity Information & Donate',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20877%403x.png',
        'title': 'Sponsors',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/ticket%403x.png',
        'title': 'Buy Tickets',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20882%403x.png',
        'title': '2023 Spectator Guide',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20884%403x.png',
        'title': '\$50K Putting Challenge',
      },
      {
        'iconUrl': 'https://raptorassistant.com/shaw-charity-classic/assets/Group%20887%403x.png',
        'title': 'Promotions',
      },
    ];

    return Drawer(
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          color: Color(0xFF01AED9),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF01AED9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.network(
                      'https://raptorassistant.com/shaw-charity-classic/assets/Logo-White%403x.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Color(0xFF0087A8),
                  );
                },
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: _selectedIndex == index ? Color(0xff414042) : null,
                    child: ListTile(
                      leading: Image.network(
                        menuItems[index]['iconUrl'],
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        menuItems[index]['title'],
                        style: TextStyle(
                          fontFamily: 'ShawMedium',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () => _onItemTapped(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,
              vertical: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      _launchTwitter();
                    },
                    child:  Image.network(
                      'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20white%20awesome-twitter%403x.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: (){
                      _launchFacebook();
                    },
                    child:  Image.network(
                      'https://raptorassistant.com/shaw-charity-classic/assets/whiteIcon%20awesome-facebook%403x.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 50,),
                  InkWell(
                    onTap: (){
                      _launchInstagram();
                    },
                    child:  Image.network(
                      'https://raptorassistant.com/shaw-charity-classic/assets/whiteIcon%20feather-instagram%403x.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
