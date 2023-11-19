import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/app-bar/app-bar.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/policy-section/policy-section.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/tour-bottom-swipable/tour-bottom-swipable.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/tour-column-divider/tour-column-divider.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/tour-course/tour-course.dart';
import 'package:shawcharityclassicfinal/tournament-information/screen/widget/tour-swipable-widget/tour-swipe-widget.dart';

import '../../dashboard/widget/nav-drawer/nav-drawer.dart';

class HomeTour extends StatefulWidget {
  State<HomeTour> createState() => HomeTourState();
}

class HomeTourState extends State<HomeTour> {
  Size get preferredSize => Size.fromHeight(100);

  final navSVG= 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          key: _scaffoldKey, // Add the GlobalKey to the Scaffold

          drawer: NavDrawer(),
          body: Stack(
            children: [

              Expanded( // Wrap the ListView with Expanded to prevent overflow
                child: ListView(
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
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-twitter%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-facebook%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-instagram%403x.png',
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Top%20Image%403x.png",
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,
                                      //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                    ),
                                  ),
                                ),
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          Positioned(
                            top: 230,
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
                                    'The Tournament',
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
                    SizedBox(height: 20),
                    SwipingWidget(),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(8),
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Ticket Info',
                        style: TextStyle(
                          fontFamily: 'ShawBold',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 550,
                      decoration: BoxDecoration(
                        color: Color(0xff00AED9),
                      ),
                      padding: EdgeInsets.all(12),
                      child: ColumnDividerWidget(),
                    ),
                    Container(
                      height: 350,
                      padding: EdgeInsets.all(12),
                      child: PolicySectionTour(),
                    ),
                    Container(
                      height: 350,
                      padding: EdgeInsets.all(12),
                      child: TourCourse(),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: 300,
                      child: TourSwipeableCardsWidget(),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Positioned(
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
              )
            ],
          ),
        )
    );
  }
}
