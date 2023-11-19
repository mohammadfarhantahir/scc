import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/home-screen-widget/home-screen-buy-ticket-widget.dart';

class BuyticketScreen extends StatefulWidget {
  State<BuyticketScreen> createState() => BuyticketScreenState();
}

class BuyticketScreenState extends State<BuyticketScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                "https://raptorassistant.com/shaw-charity-classic/assets/Shaw_Charity_Classic_Spectator_Info_2_header%403x.png",
                imageBuilder: (context, imageProvider) => Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(
                  child: Column(
                    children: [
                      Icon(Icons.error),
                      Text(
                        'Cannot load the image',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 1.8,
                left: 70,
                right: 70,
                child: Container(
                  height: 70,
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Text(
                      'Buy Tickets',
                      style: TextStyle(
                        fontFamily: 'ShawBold',
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // Enable vertical scrolling for this section
              Positioned(
                top: MediaQuery.of(context).size.height / 2.7,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Buytickethomescreen1(),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Text('Harness the emotional power of sports and create one-of-a-kind experiences for you and your guests.',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 350,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                            color: Colors.white
                        ),
                        child: Text('Hospitality Opportunities',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Positioned(
                top: kToolbarHeight - 65,
                left: 0,
                right: 0,
                child: Container(
                  height: 90,
                  width: 90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://raptorassistant.com/shaw-charity-classic/assets/Path%2058%403x.png',
                        fit: BoxFit.contain,
                      ),
                      Image.network(
                        'https://raptorassistant.com/shaw-charity-classic/assets/Logo%403x.png',
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
