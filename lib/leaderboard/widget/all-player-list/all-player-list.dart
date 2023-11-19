

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllplayerList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text('All Players',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShawBold',
                      fontSize: 18
                  ),
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Time in GMT+5:30',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawMedium',
                        fontSize: 12
                    ),
                  ),
                  SizedBox(width: 10,),
                  CachedNetworkImage(
                    imageUrl:
                    "https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-settings%403x.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                  SizedBox(width: 10,),
                ],
              )

            ],
          ),

        ],
      ),
    );
  }

}