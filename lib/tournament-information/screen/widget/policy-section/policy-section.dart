

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PolicySectionTour extends StatelessWidget{
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
        CachedNetworkImage(
          imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403xPolicy.png",
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
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
        Container(
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
          child: Expanded(
            child: Text('View Now',
              style: TextStyle(
                  fontFamily: 'ShawBold',
                  color: Colors.black,
                  fontSize: 16

              ),
              textAlign: TextAlign.center,
            ),
          )
        ),
      ],
    );
  }

}