


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TourPastWinner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Policies',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'ShawBold',
          ),
        ),
        Row(
          children: [
           Expanded(
               child:  Column(
                 children: [
                   CachedNetworkImage(
                     imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403xPolicy.png",
                     imageBuilder: (context, imageProvider) => Container(
                       height: 200,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: imageProvider,
                           fit: BoxFit.contain,
                           //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                         ),
                       ),
                     ),
                     placeholder: (context, url) => CircularProgressIndicator(),
                     errorWidget: (context, url, error) => Icon(Icons.error),
                   ),
                   Text('For everyone’s safety and comfort.',
                     style: TextStyle(
                       fontSize: 15,
                       color: Colors.black,
                       fontFamily: 'ShawRegular',
                     ),
                     textAlign: TextAlign.center,
                   ),
                 ],
               )
           ),
            Expanded(
              child:  Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403xPolicy.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                          //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Text('For everyone’s safety and comfort.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'ShawRegular',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            )
          ],
        )

      ],
    );
  }

}