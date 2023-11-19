

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPartBodySpectorinfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tournament Location',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'ShawBold',
          ),
        ),
        SizedBox(height: 20,),
        Text('Canyon Meadows Golf & Country Club 12501 14th Street, Calgary, AB T2W 2Y8',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'ShawRegular',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        CachedNetworkImage(
          imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/screencapture-google-maps-place-Canyon-Meadows-Golf-and-Country-Club-50-9412305-114-0947878-17z-data-4m6-3m5-1s0x537176aa69aae8b9-0x2af93ae0205017c3-8%403x.png",
          imageBuilder: (context, imageProvider) =>
              Container(
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

          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )

      ],
    );
  }

}