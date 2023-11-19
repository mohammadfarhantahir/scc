
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onExpand;
  final String textContent;
  final String titleText;

  CardWidget({
    required this.isExpanded,
    required this.onExpand,
    required this.textContent,
    required this.titleText,
  });

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onExpand,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.titleText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Wrap( // Use Wrap to ensure content flows in the same line
              alignment: WrapAlignment.start, // Align the content to the start (left)
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.textContent,
                    maxLines: 1, // Limit the content to one line
                    overflow: TextOverflow.ellipsis, // Ellipsize the text if it overflows
                  ),
                ),
              ],
            ),
            secondChild: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.textContent,
                // You can customize the style for the expanded text here
              ),
            ),
            crossFadeState: widget.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
