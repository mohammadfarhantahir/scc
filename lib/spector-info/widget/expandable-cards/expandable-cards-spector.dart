import 'package:flutter/material.dart';

class ExpandableCardsColumn extends StatefulWidget {
  @override
  _ExpandableCardsColumnState createState() => _ExpandableCardsColumnState();
}

class _ExpandableCardsColumnState extends State<ExpandableCardsColumn> {
  List<bool> _isExpandedList = List.generate(10, (index) => false);

  List<String> listTitle = [
    'WIFI','Cashless Event','Autographs','Food & Beverage','Cameras','Wheelchair Access','Phones','Restrooms','Lost + Found','Will Call'
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
      }),
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
            padding: EdgeInsets.all(12),
            child: Row(
              children: [

                Expanded(
                  child: Text(
                    titleText, // Use the provided titleText
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: isExpanded ? Icon(Icons.remove) : Icon(Icons.add),
                  onPressed: onExpand,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(textContent),
            ),
        ],
      ),
    );
  }
}
