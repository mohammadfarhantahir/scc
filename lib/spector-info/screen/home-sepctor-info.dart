


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../dashboard/widget/nav-drawer/nav-drawer.dart';
import '../widget/appBar-secptorinfo/appBar-spector-info.dart';
import '../widget/first-part/first-part-body.dart';
import '../widget/second-part/second-part-spector.dart';
import '../widget/spector-swipe-widget/spector-swipe-widget.dart';

class HomeSepctorInfo extends StatefulWidget{
  State<HomeSepctorInfo> createState()=> HomeSepctorInfoState();
}

class HomeSepctorInfoState extends State<HomeSepctorInfo>{
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
            key: _scaffoldKey, // Add the GlobalKey to the Scaffold

          drawer: NavDrawer(),
            body: Stack(
              children: [
                ListView(
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
                        child: Container(
                          height: 370,
                          child: Stack(
                            children: [
                              Image.network(
                                'https://raptorassistant.com/shaw-charity-classic/assets/TAK20170902-31593159-e1612891980570%403x.png',
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  top: 270,
                                  left: 0,
                                  right: 0,
                                  child:Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(8),
                                      height: 50,
                                      width: 300,
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
                                  )
                              ),
                            ],
                          ),
                        )
                    ),

                    SizedBox(height: 20),

                    Container(
                      height: 300,
                      padding: EdgeInsets.all(12),
                      child: FirstPartBodySpectorinfo(),
                    ),
                    Container(
                      child: SwipingWidgetSpector(),
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: Color(0xff01AED9)
                      ),
                      child: SecondPartSpector(),
                    )


                  ],
                ),
                Positioned(
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
                ),

              ],

            )
        )
    );
  }

}