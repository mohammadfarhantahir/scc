import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminSwipeCardWidget extends StatefulWidget {
  @override
  _SwipeCardWidgetState createState() => _SwipeCardWidgetState();
}

class _SwipeCardWidgetState extends State<AdminSwipeCardWidget> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<SponsorData> imageUrls = [];
  List<bool> isSelected = [];
  Uint8List? _selectedImageBytes;
  String? selectedImageName; // Add this line to define the selectedImageName variable
  StreamSubscription? _streamSubscription; // Add StreamSubscription

  @override
  void initState() {
    super.initState();
    _fetchImageUrls();
    // Create a periodic stream that emits a value every 1 second
    _streamSubscription = Stream.periodic(Duration(seconds: 1)).listen((_) {
      _fetchImageUrls();
    });
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the stream subscription when the widget is disposed
    _streamSubscription?.cancel();
    super.dispose();
  }

  Future<void> _fetchImageUrls() async {
    final apiUrl = 'https://raptorassistant.com:3344/fetchhomesponsorswipe';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> dataList = jsonData as List<dynamic>;

        setState(() {
          imageUrls = dataList
              .map(
                (data) => SponsorData(
              sponsorSwipeUrl: data['sponsor_swipe_url'] as String,
              id: data['id'] as int,
            ),
          )
              .toList();
          isSelected = List.generate(imageUrls.length, (_) => false);
        });
      } else {
        print('Failed to fetch image URLs. Error: ${response.body}');
      }
    } catch (error) {
      print('Error fetching image URLs: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Card(
                child: Stack(
                  children: [
                    _buildImage(imageUrls[index].sponsorSwipeUrl),

                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imageUrls.length,
                (index) => Indicator(
              index: index,
              currentIndex: _currentPage,
              isSelected: isSelected[index],
              onTap: () {
                print('clicked');

              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    if (isSelected[_currentPage]) {
      return Image.memory(
        _selectedImageBytes!, // Replace _selectedImageBytes with your Uint8List variable containing the selected image data
        fit: BoxFit.fill,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
      );
    }
  }
}

class Indicator extends StatelessWidget {
  final int index;
  final int currentIndex;
  final bool isSelected;
  final VoidCallback onTap;

  Indicator({
    required this.index,
    required this.currentIndex,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: currentIndex == index ? 12 : 8,
        height: currentIndex == index ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}

class SponsorData {
  final String sponsorSwipeUrl;
  final int id;

  SponsorData({required this.sponsorSwipeUrl, required this.id});
}
