import 'package:flutter/material.dart';

class SwipingWidget extends StatefulWidget {
  @override
  _SwipingWidgetState createState() => _SwipingWidgetState();
}

class _SwipingWidgetState extends State<SwipingWidget> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
                                image: NetworkImage(
                                    'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-arrow-left-circle%403x.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, _) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xffF5F5F5),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'A World-Class Event ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'ShawBold',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'As a three-time recipient of the President’s Award (2014, 2015, and 2017) as the top event on the PGA TOUR Champions, the Shaw Charity Classic has become a staple summer event, promising a world-class experience for golf fans and non-golf fans alike.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'ShawRegular',
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            );
                          },
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
                                image: NetworkImage(
                                    'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-arrow-right-circle%403x.png'),
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
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/TicketInfoScreenDetail'); // Navigate to the


            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              height: 40,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Text(
                'Ticket Info',
                style: TextStyle(
                  fontFamily: 'ShawBold',
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

}
