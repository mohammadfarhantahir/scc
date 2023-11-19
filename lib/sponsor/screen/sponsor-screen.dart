

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SponsorScreen extends StatefulWidget {
  State<SponsorScreen> createState() => SponsorScreenState();
}

class SponsorScreenState extends State<SponsorScreen> {
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
                imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/ShawCharityClassic_greenskybox_hospitality%403x.png",
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
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                      'Our Sponsors',
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
              Positioned(
                top: MediaQuery.of(context).size.height / 3.5,
                left: 20,
                right: 20,
                child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                  child:Column(
                  children: [
                    // i want to scroll this part
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
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
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
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
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Screenshot%202023-07-22%20at%203.41.56%20PM.png",
                              imageBuilder: (context, imageProvider) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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
                          ),
                        ],
                      ),
                    ),
                    Text('sdsd'),
                    Text('sdsd')
                  ],


                ),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
