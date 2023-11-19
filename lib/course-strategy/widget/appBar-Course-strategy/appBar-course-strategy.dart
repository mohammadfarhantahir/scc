
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class appBarCourse extends StatelessWidget{
  final navSVG= 'assets/svg/Group1.svg'; // Replace with your SVG image path
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    print('open drawer clicked');
    _scaffoldKey.currentState?.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(12),
        child: IconButton(
          icon: SvgPicture.asset(
            navSVG,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            openDrawer();
          },
        ),
      ),
      actions: [

        Row(
          children: [
            Image.network(
              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-twitter%403x.png',
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10,),
            Image.network(
              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20awesome-facebook%403x.png',
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10,),
            Image.network(
              'https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-instagram%403x.png',
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10,),
          ],
        ),
      ],
    );
  }

}