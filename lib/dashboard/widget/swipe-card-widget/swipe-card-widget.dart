import 'package:flutter/material.dart';

class SwipeCardWidget extends StatefulWidget {
  final List<String> imageUrls;

  SwipeCardWidget({required this.imageUrls});

  @override
  _SwipeCardWidgetState createState() => _SwipeCardWidgetState();
}

class _SwipeCardWidgetState extends State<SwipeCardWidget> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.fill,
                  ),
                )
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
                (index) => Indicator(
              index: index,
              currentIndex: _currentPage,
            ),
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;
  final int currentIndex;

  Indicator({required this.index, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: currentIndex == index ? 12 : 8,
      height: currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
