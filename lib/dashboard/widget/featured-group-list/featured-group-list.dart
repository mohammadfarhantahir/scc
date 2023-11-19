import 'package:flutter/material.dart';

class FeaturedGroupsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF5F5F5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Color(0xff00AED9),
              ),
              height: 50,
              child: Center(
                child: Text(
                  'Featured Group',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'ShawBold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '10:10 AM - #1',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://raptorassistant.com/shaw-charity-classic/assets/Hole-18_screenshot%403x.png',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Color(0xff009AC7).withOpacity(0.8),
                        ),
                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/John%20Daly%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Fred Couples',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/Fred%20Couples%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Darren Clarke',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/Mike%20Weir%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Padraig Harrington',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )




                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '10:20 AM - #10',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://raptorassistant.com/shaw-charity-classic/assets/Hole-18_screenshot%403x.png',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Color(0xff009AC7).withOpacity(0.8),
                        ),
                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/John%20Daly%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Fred Couples',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/Fred%20Couples%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Darren Clarke',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        'https://raptorassistant.com/shaw-charity-classic/assets/Mike%20Weir%403x.png',
                                      ),
                                      radius: 30,
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'Padraig Harrington',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )




                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
