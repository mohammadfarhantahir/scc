

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromotionScreen extends StatefulWidget{
  State<PromotionScreen> createState()=> PromotionScreenState();
}

class PromotionScreenState extends State<PromotionScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                  "https://raptorassistant.com/shaw-charity-classic/assets/TAK20170901-1385%403x1.png",
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
                        'Promotions',
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
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(12),
                          height: 350,
                          width: MediaQuery.of(context).size.width,

                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                "https://raptorassistant.com/shaw-charity-classic/assets/ShawCharityClassic_Hospitality_Fun%403x.png",
                                imageBuilder: (context, imageProvider) => Container(
                                  height: 200,
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
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child:Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text('Show at this spot to receive 20% off coffee',
                                            style: TextStyle(
                                              fontFamily: 'ShawRegular',
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                    ),
                                    Expanded(
                                        child:Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Color(0xff00AED9),
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Text('Code: SCC-XYZ20',
                                            style: TextStyle(
                                              fontFamily: 'ShawBold',
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),


                        SizedBox(height: 10,),
                        Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.all(12),
                            height: 350,
                            width: MediaQuery.of(context).size.width,

                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://raptorassistant.com/shaw-charity-classic/assets/ShawCharityClassic_Hospitality_Marquee_1080x1080_V3%403x.png",
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 200,
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
                                Container(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child:Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text('Show at this spot to receive 30% off coffee',
                                              style: TextStyle(
                                                fontFamily: 'ShawRegular',
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          child:Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xff00AED9),
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Text('Code: SCC-XYZ30',
                                              style: TextStyle(
                                                fontFamily: 'ShawBold',
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.all(12),
                            height: 350,
                            width: MediaQuery.of(context).size.width,

                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://raptorassistant.com/shaw-charity-classic/assets/SCC_PremiumPass-Tickets_3%403x.png",
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 200,
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
                                Container(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child:Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text('Show at this spot to receive 25% off coffee',
                                              style: TextStyle(
                                                fontFamily: 'ShawRegular',
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          child:Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xff00AED9),
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Text('Code: SCC-XYZ25',
                                              style: TextStyle(
                                                fontFamily: 'ShawBold',
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
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
        )
    );
  }

}