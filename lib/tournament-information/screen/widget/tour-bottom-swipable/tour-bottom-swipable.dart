

import 'package:flutter/material.dart';

class TourSwipeableCardsWidget extends StatefulWidget {
  @override
  _SwipeableCardsWidgetState createState() => _SwipeableCardsWidgetState();
}

class _SwipeableCardsWidgetState extends State<TourSwipeableCardsWidget> {
  int _currentIndex = 0;
  List<String> _cardImages = [
    'https://raptorassistant.com/shaw-charity-classic/assets/2022%20-%20Jerry%20Kelly%403x.png',
    'https://raptorassistant.com/shaw-charity-classic/assets/2021%20-%20Doug%20Barron%403x.png',
    'https://raptorassistant.com/shaw-charity-classic/assets/2022%20-%20Jerry%20Kelly%403x.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Past Winners',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'ShawBold',

              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  setState(() {
                    _currentIndex = (_currentIndex - 1).clamp(0, _cardImages.length - 1);
                  });
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  setState(() {
                    _currentIndex = (_currentIndex + 1).clamp(0, _cardImages.length - 1);
                  });
                }
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: _cardImages.length,
                      controller: PageController(initialPage: _currentIndex),
                      onPageChanged: (int index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                 Expanded(
                                   flex:2,
                                     child:  Image.network(_cardImages[index]),
                                 ),
                                  Expanded(
                                      child:Text('Jerry Kelly 2022',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'ShawRegular',
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                children: [
                                Expanded(
                                  flex:2,
                                    child:  Image.network(_cardImages[index])
                                ),
                                  Expanded(
                                      child:Text('Jerry Kelly 2022',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'ShawRegular',
                                        ),
                                      )
                                  )

                                ],
                              )
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(_cardImages.length, (int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
