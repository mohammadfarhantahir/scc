
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExpandableCardsColumnPolicies extends StatefulWidget {
  @override
  _ExpandableCardsColumnState createState() => _ExpandableCardsColumnState();
}

class _ExpandableCardsColumnState extends State<ExpandableCardsColumnPolicies> {
  List<bool> _isExpandedList = List.generate(10, (index) => false);

  List<String> listTitle = [
    'Ticketing Admissions','Signage & Guidelines','Onsite Transactions & Payments','The Final Putt','Questions','Terms of Entry','Bags & Personal Items','Mobile Devices','Suspicious Activity','Weather Warnings & Suspension of Play','Tournament Attire'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) {
        return CardWidget(
          isExpanded: _isExpandedList[index],
          onExpand: () {
            setState(() {
              _isExpandedList[index] = !_isExpandedList[index];
            });
          },
          textContent: 'Connect to Shaw for FREE Wi-fi throughout the tournament. ${index + 1} Content',
          titleText: listTitle[index], // Added titleText property
        );
      }
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onExpand;
  final String textContent;
  final String titleText; // Added titleText property

  const CardWidget({
    required this.isExpanded,
    required this.onExpand,
    required this.textContent,
    required this.titleText, // Updated constructor with titleText
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            padding: EdgeInsets.all(18),
            child: Row(
              children: [

                Expanded(
                  child: Text(
                    titleText, // Use the provided titleText
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: isExpanded ?  CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-minus-circle%403x.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 30,
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
                  ) : CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/shaw-charity-classic/assets/Icon%20feather-plus-circle%403x.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 30,
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
                  onPressed: onExpand,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Text(textContent,
              style: TextStyle(
               // fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'ShawRegular',

              ),),
            ),
        ],
      ),
    );
  }
}
