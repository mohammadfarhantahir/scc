import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResponsiveSliderSponsor extends StatefulWidget {
  @override
  _ResponsiveSliderState createState() => _ResponsiveSliderState();
}

class _ResponsiveSliderState extends State<ResponsiveSliderSponsor> {
  List<Map<String, dynamic>> _sliderData = [];
  int _currentPage = 0;
  Timer? _fetchTimer; // Variable to hold the Timer
  int _maxItemsToShow = 4;
  bool _showAllItems = false;

  @override
  void initState() {
    super.initState();
    _fetchSliderData();
    // Start the periodic timer to fetch the latest image every 1 second
    _fetchTimer = Timer.periodic(Duration(seconds: 1), (_) => _fetchSliderData());
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is removed from the widget tree
    _fetchTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchSliderData() async {
    final apiUrl = 'https://raptorassistant.com:3344/fetchhomeswipable';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        // Check if the widget is mounted before calling setState
        if (mounted) {
          setState(() {
            _sliderData = List<Map<String, dynamic>>.from(jsonData);
          });
        }
      } else {
        print('Failed to fetch slider data. Error: ${response.body}');
      }
    } catch (error) {
      print('Error fetching slider data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final int itemsPerPage = 4;
    final int pageCount = (_sliderData.length / itemsPerPage).ceil();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: pageCount,
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * itemsPerPage;
              final endIndex = (pageIndex + 1) * itemsPerPage;
              final pageData = _sliderData.sublist(startIndex, endIndex > _sliderData.length ? _sliderData.length : endIndex);

              return GridView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _showAllItems
                    ? pageData.length
                    : (_maxItemsToShow <= pageData.length ? _maxItemsToShow : pageData.length), // Update the itemCount condition
                shrinkWrap: true, // Add this line to make the GridView take only the space it needs
                itemBuilder: (context, index) {
                  final imageUrl = pageData[index]['sponsor_url'];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 100,
                      width: 250,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error),
                            SizedBox(height: 5,),
                            Text('Oops Something went wrong\nCannot load image')
                          ],
                        ),
                        imageUrl: imageUrl,
                        fit: BoxFit.contain, // Image will fit inside the Container without cropping or distorting
                      ),
                    )

                  );
                },
              );
            },
          ),
        ),
        Container(
          width: 350,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _showAllItems = !_showAllItems;
              });
            },
            child: Text(
              'Load More',
              style: TextStyle(
                fontFamily: 'ShawBold',
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

      ],
    );
  }
}
