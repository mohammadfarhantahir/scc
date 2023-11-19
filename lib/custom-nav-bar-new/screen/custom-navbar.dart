

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget{
  State<CustomNavBar> createState()=> CustomNavBarState();
}
class CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  // here we are making function to navigate between the screen by calling simple if else condition [this is the simplest and easy form to show you(for beginner)]
  void _navigatopages(){
    if(selectedIndex==0){
      // here we are setting the state
      setState(() {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/dashboardScreen'); // Navigate to the dashboard



      });
    }
    else if(selectedIndex==1){
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/BuyticketScreen'); // Navigate to the buyticket

    }
    else if(selectedIndex==2){
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/LeaderboardScreen'); // Navigate to the buyticket

    }
    else {
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/SponsorScreen'); // Navigate to the donate screen

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xff414042),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          buildNavBarItem(
            index: 0,
            imageUrl:
            "https://raptorassistant.com/shaw-charity-classic/assets/9-Home%403x.png",
            label: "Home",
          ),
          SizedBox(width: 50),
          buildNavBarItem(
            index: 1,
            imageUrl:
            "https://raptorassistant.com/shaw-charity-classic/assets/ticket%403x.png",
            label: "TICKETS",
          ),
          SizedBox(width: 50),
          buildNavBarItem(
            index: 2,
            imageUrl:
            "https://raptorassistant.com/shaw-charity-classic/assets/Layer%202%403x.png",
            label: "LEADERBOARD",
          ),
          SizedBox(width: 50),
          buildNavBarItem(
            index: 3,
            imageUrl:
            "https://raptorassistant.com/shaw-charity-classic/assets/money%403x.png",
            label: "DONATE ",
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildNavBarItem({
    required int index,
    required String imageUrl,
    required String label,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          // we call the above _navigatopages() function
          selectedIndex = index;
          _navigatopages();
        });
      },
      child: Stack(
        children: [
          // Blue transparent container on top
          if (selectedIndex == index)
            Positioned.fill(
              child: Container(
                color: Colors.blue.withOpacity(0.4), // Change the opacity as needed
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: selectedIndex == index ? Color(0xff00AED9) : Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
