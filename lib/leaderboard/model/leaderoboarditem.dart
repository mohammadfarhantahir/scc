import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LeaderboardItem extends StatefulWidget {
  final dynamic item;

  LeaderboardItem(this.item);

  @override
  _LeaderboardItemState createState() => _LeaderboardItemState();
}

class _LeaderboardItemState extends State<LeaderboardItem> {
  bool _isExpanded = false;
  dynamic _detailData;

  @override
  void initState() {
    super.initState();
    fetchDetailData();
  }

  Future<void> fetchDetailData() async {
    final url = Uri.parse('https://raptorassistant.c'
        'om:3344/leaderboardallplayer=${widget.item['player_guid']}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _detailData = json.decode(response.body);
      });
    } else {
      // Handle error, show error message or retry logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(widget.item['pos'],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawMedium',
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Expanded(
                      child:Text(widget.item['player_name']
                        ,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawMedium',
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Expanded(
                      child:InkWell(
                        onTap: (){
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child:  Text(widget.item['total'].toString()
                          ,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawMedium',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                  Expanded(
                      child: Text(widget.item['thru'],
                        style: TextStyle(
                            color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Expanded(
                      child:Text(widget.item['rnd'],
                        style: TextStyle(
                            color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),



                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
