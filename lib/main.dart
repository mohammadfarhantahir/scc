import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shawcharityclassicfinal/policies/screen/policy-home-screen.dart';
import 'package:shawcharityclassicfinal/promotions/screen/promotion-screen-new.dart';
import 'package:shawcharityclassicfinal/promotions/screen/promotions-screen.dart';
import 'package:shawcharityclassicfinal/spectator-guide/screen/spectator-guide.dart';
import 'package:shawcharityclassicfinal/spectator-guide/screen/spector-guide-screen-new.dart';
import 'package:shawcharityclassicfinal/spector-info/screen/home-sepctor-info.dart';
import 'package:shawcharityclassicfinal/spector-info/screen/home-spectator-information-new.dart';
import 'package:shawcharityclassicfinal/sponsor/screen/sponsor-screen-new.dart';
import 'package:shawcharityclassicfinal/sponsor/screen/sponsor-screen.dart';
import 'package:shawcharityclassicfinal/test.dart';
import 'package:shawcharityclassicfinal/testing.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/tour-home.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/ticket-info-screen.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/tourament-home-screen-new.dart';
import 'package:shawcharityclassicfinal/welcome-screen/screen/welcome-screen-new.dart';


import '50k-challenge/screens/50k-challenge-screen-new.dart';
import '50k-challenge/screens/50k-challenge-screen.dart';
import 'buy-ticket/screen/buy-ticket-new-screen.dart';
import 'buy-ticket/screen/buy-ticket-screen.dart';
import 'charity-information-donation/screen/charity-information-donation-new.dart';
import 'charity-information-donation/screen/charity-information-donation.dart';
import 'course-map/screen/course-map-screen.dart';
import 'course-strategy/screen/course-strategy-home.dart';
import 'daily-pairing/screen/daily-pairing-home.dart';
import 'dashboard/screenn/dashboard-screen.dart';
import 'dashboard/widget/bottombar-screen/bottom-bar-screen.dart';
import 'leaderboard/screen/leaderboard-screen-new.dart';
import 'leaderboard/screen/leaderboard-screen.dart';
import 'welcome-screen/screen/welcome-screen.dart';
import 'dart:io';
Future<void> main() async {
  // Ensure the binding is properly initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Lock screen orientation to portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Bypass SSL certificate verification (for testing purposes only)
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //  primarySwatch: Colors.blue, // Set the primary color for the app
        buttonColor: Colors.green, // Set the default button color
        textTheme: TextTheme(
          // Define the text styles for the app
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      home: WelcomeScreenNew(),
      routes: {
        // Define named routes for navigation
        '/dashboardScreen': (context) => DashboardScreen(), // Add the route for DashboardScreen
        '/tournamentScreen': (context) => TournamentHomeScreenNew(),
        '/spectorScreen': (context) => SpectatorInformationNew(),
        '/courseScreen': (context)=> PageViewScreen(),
        '/LeaderboardScreen': (context)=> LeaderBoardScreenNew(),
        '/CharityInformationDonation': (context)=>CharityInformationAndDonation(),
        '/SponsorScreen':(context)=> SponsorNewScreen(),
        '/BuyticketScreen': (context)=> BuynewTicketScreen(),
        '/SpectatorGuidescreen': (context)=> SpectorGuidenew(),
        '/FiftykChallengeScreen': (context)=> FiftKchallengeScreenNew(),
        '/PromotionScreen': (context)=> PromotionScreenNew(),
        '/DailyPairing': (context)=> DailyPairing(),
        '/CourseMapScreen': (context)=> CourseMapScreen(),
        '/TicketInfoScreenDetail': (context)=> TicketInfoScreenDetail(),
        '/PolicyHomeScreen':(context)=> PolicyHomeScreen()
        //'/third': (context) => ThirdPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/HomeScreennew':
            return MaterialPageRoute(builder: (context) => DashboardScreen());
          case '/tournamentScreen':
            return MaterialPageRoute(builder: (context) => HomeTour());
          case '/spectorScreen':
            return MaterialPageRoute(builder: (context) => SpectatorInformationNew());
          case '/courseScreen':
            return MaterialPageRoute(builder: (context) => PageViewScreen());
          case '/LeaderboardScreen':
            return MaterialPageRoute(builder: (context) => LeaderboardScreennav());
          case '/CharityInformationDonation':
            return MaterialPageRoute(builder: (context) => CharityInformationDonation());
          case '/SponsorScreen':
            return MaterialPageRoute(builder: (context) => SponsorScreen());
          case '/BuyticketScreen':
            return MaterialPageRoute(builder: (context) => BuyticketScreen());
          case '/SpectatorGuidescreen':
            return MaterialPageRoute(builder: (context) => SpectatorGuidescreen());
          case '/FiftykChallengeScreen':
            return MaterialPageRoute(builder: (context) => FiftykChallengeScreen());
          case '/PromotionScreen':
            return MaterialPageRoute(builder: (context) => PromotionScreen());
          case '/DailyPairing':
            return MaterialPageRoute(builder: (context) => DailyPairing());
          default:
           // return MaterialPageRoute(builder: (context) => UnknownScreen());
        }
      },
    );
  }
}