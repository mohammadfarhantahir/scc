import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class GolfLeaderboardScreen extends StatefulWidget {
  @override
  _GolfLeaderboardScreenState createState() => _GolfLeaderboardScreenState();
}

class _GolfLeaderboardScreenState extends State<GolfLeaderboardScreen> {
  Map<String, dynamic> leaderboardData = {};
  String? currrentrank;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredRankings = [];

  @override
  void initState() {
    super.initState();
    _fetchLeaderboardData();
  }

  void _fetchLeaderboardData() async {
    final response = await http.get(Uri.parse('https://raptorassistant.com:3344/pgaranking'));

    if (response.statusCode == 200) {
      setState(() {
        leaderboardData = json.decode(response.body);
        final titleOfJson = leaderboardData['meta']['title']; // Access the 'title' property from the 'meta' object

        // Access the 'fields' object, and then access the 'last_updated' property within it
        final lastUpdatedJson = leaderboardData['meta']['fields']['last_updated'];

        // Access the 'results' object and its properties
        final resultOfJson = leaderboardData['results']['last_updated'];
        final rankingResultOfJson = leaderboardData['results']['rankings'];

        print(response.body);
        // print('Title is: $titleOfJson');
        // print('Last update is: $lastUpdatedJson');
        print('Result is: $resultOfJson');
        print('Ranking result: $rankingResultOfJson');
        currrentrank = rankingResultOfJson.toString();
        // Initialize the filteredRankings with all the rankings initially
        filteredRankings = rankingResultOfJson;
      });
    } else {
      print('Failed to load data. Error: ${response.statusCode}');
    }
  }

  void _filterRankings() {
    String searchQuery = _searchController.text.toLowerCase();

    setState(() {
      filteredRankings = leaderboardData['results']['rankings'].where((ranking) {
        String fullName = ranking['first_name'] + ' ' + ranking['last_name'];
        return fullName.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => _filterRankings(),
            decoration: InputDecoration(
              hintText: 'Search participant',
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                  right: Radius.circular(25),
                ),
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
              suffixIcon: Icon(Icons.search,color: Color(0xFFCCCCCC),),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFCCCCCC),
              borderRadius: BorderRadius.circular(12)
            ),
            child: _buildLeaderboardListView(),
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget _buildLeaderboardListView() {
    if (leaderboardData.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // Use the filteredRankings instead of the original rankings
    final List<dynamic>? rankings = filteredRankings.isEmpty ? leaderboardData['results']['rankings'] : filteredRankings;
    if (rankings == null || rankings.isEmpty) {
      return Center(
        child: Text('Data not found',
          style: TextStyle(
            fontFamily: 'ShawBold',
            color: Colors.black,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    int numberOfColumns = 3;
    int numberOfRows = (rankings!.length / numberOfColumns).ceil();

    return ListView.builder(
      itemCount: numberOfRows,
      itemBuilder: (context, rowIndex) {
        int startingIndex = rowIndex * numberOfColumns;
        int endingIndex = (startingIndex + numberOfColumns) < rankings.length
            ? (startingIndex + numberOfColumns)
            : rankings.length;

        List<dynamic> rowRankings = rankings.sublist(startingIndex, endingIndex);

        int rank = rowRankings[0]['current_rank'];
        String updateitme = rowRankings[0]['updated_at'];
        DateTime updatedDateTime = DateTime.parse(updateitme);
        String formattedUpdateTime = DateFormat('h:mm a').format(updatedDateTime);

        return Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(formattedUpdateTime,
                  style: TextStyle(
                    fontFamily: 'ShawBold',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10,),
                Text('#'+rank.toString(),
                  style: TextStyle(
                    fontFamily: 'ShawBold',
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10,),
              ],
            ),
            SizedBox(height: 10,),
            CachedNetworkImage(
              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Hole-18_screenshot%403x.png",
              imageBuilder: (context, imageProvider) => Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Color(0xff00AED9), BlendMode.hardLight)
                  ),
                ),
                child: Center(
                  child: _buildRowWithColumns(rowRankings),
                ),
              ),
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 10,)
          ],
        );
      },
    );
  }

  Widget _buildRowWithColumns(List<dynamic> rowRankings) {
    return Row(
      children: rowRankings.map((ranking) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(
                  child:  CachedNetworkImage(
                    imageUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/noimage.jpeg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                    child:  Container(
                  child: Center(
                    child: Text(
                      ranking['first_name'] + ' ' + ranking['last_name'],
                      style: TextStyle(
                        fontFamily: 'ShawRegular',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis, // Show ellipsis (...) if text overflows
                    ),
                  )
                )),
                SizedBox(height: 10,),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
