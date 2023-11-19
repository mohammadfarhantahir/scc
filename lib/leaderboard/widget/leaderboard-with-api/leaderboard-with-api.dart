import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class LeaderBoardScreenApiNew extends StatefulWidget {
  State<LeaderBoardScreenApiNew> createState() => LeaderBoardScreenApiNewState();
}

class LeaderBoardScreenApiNewState extends State<LeaderBoardScreenApiNew> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredRankings = [];
  Map<String, dynamic> leaderboardDataDetailed = {};
  String? currentRank;

  @override
  void initState() {
    super.initState();
    _fetchLeaderboardData();
  }

  void _fetchLeaderboardData() async {
    final response = await http.get(Uri.parse('https://api-test.pgatourhq.com:8243/LastMsgCount/1.0.0?format=json'));

    if (response.statusCode == 200) {
      setState(() {
        leaderboardDataDetailed = json.decode(response.body);
        final leaderboard = leaderboardDataDetailed['results']['leaderboard'];

        // Initialize the filteredRankings with all the rankings initially
        filteredRankings = leaderboard;
      });
    } else {
      print('Failed to load data. Error: ${response.statusCode}');
    }
  }

  void _filterRankings() {
    String searchQuery = _searchController.text.toLowerCase();

    setState(() {
      filteredRankings = leaderboardDataDetailed['results']['leaderboard'].where((ranking) {
        String fullName = ranking['first_name'] + ' ' + ranking['last_name'];
        return fullName.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: (_) => _filterRankings(),
                decoration: InputDecoration(
                  hintText: 'Search by Player',
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25),
                      right: Radius.circular(25),
                    ),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  suffixIcon: Icon(Icons.search, color: Color(0xFFCCCCCC)),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                    color: Color(0xff00AED9), // Replace with your desired color
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'POS',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'PLAYER',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'TOTAL',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'THRU',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'RND',
                          style: TextStyle(
                            fontFamily: 'ShawBold',
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: filteredRankings.length,
                    itemBuilder: (context, index) {
                      final ranking = filteredRankings[index];
                      final position = ranking['position'];
                      final playerFirstName = ranking['first_name'];
                      final playerLastName = ranking['last_name'];
                      final playerTotalPar = ranking['total_to_par'];
                      final playerCurrentRound = ranking['current_round'];
                      final playerStroke = ranking['strokes'];

                      // Check if the current index is divisible by 3 (except for the first row)
                      bool isDividerRow = index > 0 && (index + 1) % 3 == 0;

                      return Column(
                        children: [
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    position.toString(),
                                    style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    playerFirstName + '\n' + playerLastName,
                                    style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    playerTotalPar.toString(),
                                    style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'F',
                                    style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    playerCurrentRound.toString(),
                                    style: TextStyle(
                                      fontFamily: 'ShawMedium',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isDividerRow)
                           Container(
                             margin: const EdgeInsets.all(15.0),
                             padding: const EdgeInsets.all(3.0),
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey),
                               borderRadius: BorderRadius.circular(12)
                             ),
                             child:  CachedNetworkImage(
                               imageUrl:
                               "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%201.44.55%20PM.png",
                               imageBuilder: (context, imageProvider) => Container(
                                 padding: EdgeInsets.all(12),
                                 height: 150,
                                 width: MediaQuery.of(context).size.width,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: imageProvider,
                                     fit: BoxFit.fitWidth,
                                   ),
                                 ),
                               ),
                               placeholder: (context, url) =>
                                   Center(child: CircularProgressIndicator()),
                               errorWidget: (context, url, error) => Icon(Icons.error),
                             ),
                           ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
