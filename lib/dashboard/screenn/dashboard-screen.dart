import 'package:flutter/material.dart';
import '../../buy-ticket/screen/buy-ticket-screen.dart';
import '../../charity-information-donation/screen/charity-information-donation-new.dart';
import '../../charity-information-donation/screen/charity-information-donation.dart';
import '../../comman-nav-bar/comman-nav-bar.dart';
import '../../custom-nav-bar-new/screen/custom-navbar.dart';
import '../../leaderboard/screen/leaderboard-screen.dart';

import '../widget/nav-drawer/nav-drawer.dart';
import 'home-screen/home-screen.dart';

class DashboardScreen extends StatefulWidget {
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final navSVG= 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }
  int _currentIndex = 0;
  int _selectedIndex = 0;


  List<Widget> _screens = [
    HomeScreennew(),
    BuyticketScreen(),
    LeaderboardScreennav(),
    CharityInformationAndDonation(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,

        drawer: NavDrawer(),
        body:_screens[_selectedIndex],
        bottomNavigationBar: CustomNavBar()
      ),
    );
  }
}
