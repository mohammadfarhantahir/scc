import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AvatarRowScreen extends StatefulWidget {
  @override
  _AvatarRowScreenState createState() => _AvatarRowScreenState();
}

class _AvatarRowScreenState extends State<AvatarRowScreen> {
  final String apiUrl = 'https://raptorassistant.com:3344/daily_parining';
  List<AvatarRowData> rowData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        setState(() {
          rowData = jsonData
              .map((data) => AvatarRowData.fromJson(data))
              .toList();
        });
      } else {
        print('Failed to fetch data. Error: ${response.body}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: (rowData.length / 3).ceil(), // Divide by 3 to create rows
        itemBuilder: (context, index) {
          final startIdx = index * 3;
          final endIdx = (index + 1) * 3;
          final rowDataSubset = rowData.sublist(startIdx, endIdx);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            rowDataSubset.map((data) => AvatarColumn(data)).toList(),
          );
        },
      ),
    );
  }
}

class AvatarRowData {
  final String name;
  final String avatarImage;

  AvatarRowData(this.name, this.avatarImage);

  factory AvatarRowData.fromJson(Map<String, dynamic> json) {
    return AvatarRowData(
      json['playername'] ?? '',
      'assets/${json['player_flag']}.png', // Assuming you have flag images in assets folder
    );
  }
}

class AvatarColumn extends StatelessWidget {
  final AvatarRowData rowData;

  AvatarColumn(this.rowData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(rowData.avatarImage),
        ),
        SizedBox(height: 8),
        Text(rowData.name),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AvatarRowScreen(),
  ));
}
