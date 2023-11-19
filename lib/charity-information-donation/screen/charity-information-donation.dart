


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharityInformationDonation extends StatefulWidget{
  State<CharityInformationDonation> createState()=> CharityInformationDonationState();
}

class CharityInformationDonationState extends State<CharityInformationDonation>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  ListView(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                    "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
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
                          Text('Cannot load the image',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(30),
                    constraints: BoxConstraints(
                      maxWidth: 250,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Center(
                      child: Text(
                        'Charity Information & Donate',
                        style: TextStyle(
                          fontFamily: 'ShawBold',
                          color: Colors.black,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  CachedNetworkImage(
                    imageUrl:
                    "https://raptorassistant.com/shaw-charity-classic/assets/shw_birdiesforkids_logo_lockup_200px-01%403x.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 150,
                      width: 150,
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
                          Text('Cannot load the image',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text('Our Cause',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawBold',
                          fontSize: 24
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child:  Text('Besides watching some of the best golfers compete in our province, our real drive is helping the kids who call Alberta home. Thanks to your support, we have raised over \$93 million dollars for over 270 children and youth charities across Alberta.',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawMedium',
                          fontSize: 16
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TK140828-821-1%403x.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                           colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.colorBurn)
                        ),
                      ),
                      child: Center(
                        child: Text('The Calgary Shaw Charity Classic Foundation is a registered charity, CRA number 827378977 RR0001',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ShawBold',
                              fontSize: 18
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),

                    child: Text('All administrative costs and efforts for the program including website administration, credit card fees, invoicing, etc. will be covered by the Shaw Charity Classic tournament. This means that 100% of all funds donated through the program will go directly to your charity of choice. On top of the donation, the most exciting part of Birdies for Kids is the matching pool. For every generous contribution, the Calgary Shaw Charity Classic Foundation will match up to 50%.',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawMedium',
                        fontSize: 16
                    ),
                      textAlign: TextAlign.center,


                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black)
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(16),
                    child: Text('Donate Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawBold',
                          fontSize: 16
                      ),
                      textAlign: TextAlign.center,


                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                   color: Color(0xff00AED9),
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(30),
                          child: Text('Shaw Birdies for Kids presented by AltaLink',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                fontSize: 24
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20170829-1724%403x.png",
                          imageBuilder: (context, imageProvider) => Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                   // colorFilter: ColorFilter.mode(Colors.lightBlueAccent, BlendMode.colorBurn)
                                ),
                              ),

                          ),
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text('A non-profit program under the Calgary Shaw Charity Classic Foundation. This program is designed to help raise new funds for local charities, engage the community in the tournament, and provide matching funds for each charity involved.',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawMedium',
                                fontSize: 16
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:1,
                                  child:Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                              ),
                              Expanded(
                                flex: 9,
                                  child:Text('You can donate online or by cheque between March 1 and August 31',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawMedium',
                                        fontSize: 16
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              )
                            ],
                          )
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:1,
                                  child:Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child:Text('Donations can be made to the Shaw Charity Classic Foundation matching pool or directly to a participating charity',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawMedium',
                                        fontSize: 16
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:1,
                                  child:Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child:Text('Donations directed to a participating charity are matched up to 50% using the Foundation matching pool',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawMedium',
                                        fontSize: 16
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:1,
                                  child:Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child:Text('All administrative costs are covered by the tournament, meaning 100% of all donations will go directly to the charity selected.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawMedium',
                                        fontSize: 16
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text('Become a Participating Charity',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              fontSize: 24
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10,),
                        Text('The 2023 application process is now closed.',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawMedium',
                              fontSize: 16
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.black)
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(16),
                    child: Text('Get In Touch',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'ShawBold',
                          fontSize: 16
                      ),
                      textAlign: TextAlign.center,


                    ),
                  ),
                ],
              ),

          )
        )
    );
  }

}