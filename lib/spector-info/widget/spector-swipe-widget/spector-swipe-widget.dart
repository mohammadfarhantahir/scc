import 'package:flutter/material.dart';

class SwipingWidgetSpector extends StatefulWidget {
  @override
  _SwipingWidgetStateSpectpr createState() => _SwipingWidgetStateSpectpr();
}

class _SwipingWidgetStateSpectpr extends State<SwipingWidgetSpector> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200, // Specify a fixed height for the PageView
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: _goToPreviousPage,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-arrow-left-circle%403x.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffF5F5F5),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Parking & Directions ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'ShawBold',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'A complimentary shuttle service is available from Anderson LRT Station (11015 Anderson Station Way SW) that will take you to the main Admissions Entrance. Please note that there is no parking available on-site at Canyon Meadows Golf & Country Club.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'ShawRegular',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: _goToNextPage,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-arrow-right-circle%403x.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(3, (int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

