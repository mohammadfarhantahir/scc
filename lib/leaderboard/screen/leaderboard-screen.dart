

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../dashboard/widget/nav-drawer/nav-drawer.dart';
import '../model/leaderoboarditem.dart';
import '../widget/all-player-list/all-player-list.dart';
import '../widget/appBar-leaderboard/appBarLeaderboard.dart';

class LeaderboardScreennav extends StatefulWidget {
  State<LeaderboardScreennav> createState() => LeaderboardScreenState();
}

class LeaderboardScreenState extends State<LeaderboardScreennav> {
  List<dynamic> _leaderboardData = [];
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  final navSVG = 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://raptorassistant.com:3344/leaderboardallplayer');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _leaderboardData = json.decode(response.body);
      });
    } else {
      // Handle error, show error message or retry logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Add the GlobalKey to the Scaffold
        drawer: NavDrawer(),
        body: Stack(
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


          SingleChildScrollView(
            child:    Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CachedNetworkImage(
                  imageUrl:
                  "https://raptorassistant.com/shaw-charity-classic/assets/Shaw_Charity_Classic_Spectator_Info_3_header%403x1.png",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                Container(
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                    maxWidth: 250,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontFamily: 'ShawBold',
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      hintText: 'Search by Player',
                      hintStyle: TextStyle(
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Text('Winner',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'ShawBold',
                                  fontSize: 18
                              ),
                              textAlign: TextAlign.start,
                            ),
                          )
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xff00AED9),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              "https://raptorassistant.com/shaw-charity-classic/assets/headshots_01666%403x.png",
                              imageBuilder: (context, imageProvider) => Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Column(
                              children: [
                                Text('Bernhard Langer',
                                  style: TextStyle(
                                      fontFamily: 'ShawBold',
                                      fontSize: 16
                                  ),
                                ),
                                Text('TOT 277',
                                  style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      fontSize: 14
                                  ),
                                ),

                              ],
                            ),
                            Text('-7',
                              style: TextStyle(
                                fontFamily: 'ShawBold',
                                fontSize: 22,
                              ),
                            )
                          ],
                        ),
                      ),
                      AllplayerList(),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(12),
                        height: 50,
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
                            Text(
                              'Pos',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Player',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Thru',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Rnd',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*2,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(), // Prevent the ListView from scrolling
                          itemCount: _leaderboardData.length,
                          itemBuilder: (context, index) {
                            final item = _leaderboardData[index];

                            // Check if the index is divisible by 10 (after the first item)
                            if (index > 0 && index % 3 == 0) {
                              return Container(
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.black)
                                ),
                                height: 100, // Adjust the height as needed
                                child: Row(
                                  children: [
                                    Expanded(
                                        child:CachedNetworkImage(
                                          imageUrl:
                                          "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%201.44.55%20PM.png",
                                          imageBuilder: (context, imageProvider) => Container(
                                            padding: EdgeInsets.all(12),
                                            height: 350,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              Center(child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              // Normal leaderboard item
                              return Container(
                                padding: EdgeInsets.all(12),

                                child: InkWell(
                                  onTap: (){
                                    print('item clicked');
                                    setState(() {
                                      _isExpanded == true;
                                    });
                                  },
                                  child:ExpansionTile(
                                    backgroundColor: Color(0xff00AED9),
                                    title: LeaderboardItem(item),
                                    trailing: SizedBox.shrink(), // Set the trailing property to null or an empty widget
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            child: Row(
                                              children: [
                                                Text('Round 1',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                    fontFamily: 'ShawBold',
                                                    fontSize: 16
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Hole',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('10',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('11',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('12',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('13',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('14',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('15',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('16',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('17',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('18',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('IN',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('TOT',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('PAR',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('36',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('72',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('R1',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('32',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('66',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('STATUS',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-1',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-2',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-6',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-6',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('-6',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        ],
                                      )

                                      // Add more widgets as needed for the expanded layout
                                    ],
                                    onExpansionChanged: (expandedState) {
                                      setState(() {
                                        print('exapnsion clicked');
                                        _isExpanded == false;
                                      });
                                    },
                                    //  initiallyExpanded: expanded[index],
                                  ),
                                ),
                              );
                            }
                          },
                        ),


                      )
                    ],
                  ),
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
