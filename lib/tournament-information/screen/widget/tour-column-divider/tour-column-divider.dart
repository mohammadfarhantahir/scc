import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ColumnDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Text(
            'Shaw Charity Classic',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'ShawBold',
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 150, // Provide a fixed height for CachedNetworkImage
          child: CachedNetworkImage(
            imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/TAK20220907-1003-1%403x.png",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                  // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child:  Text(
            '   The Shaw Charity Classic is backed by a philanthropic group of Calgary business leaders known as “The Patron Group.” In 2012, the late Clay Riddell brought community leaders together, including: Jim Riddell, Allan Markin, Keith MacPhail, Guy Turcotte, Gary Peddle, Mike Culbert and PGA Tour Professional, Stephen Ames. Together they created the Shaw Charity Classic – the PGA TOUR Champions’ only Canadian event.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'ShawRegular',
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(12),
          child: Text(' Thanks to the leadership of the entire Patron Group, along with the unwavering commitment of Albertans who show up to support the more than 230 charitable groups, the Shaw Charity Classic has now raised more than \$76 million for children in need.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'ShawRegular',
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
