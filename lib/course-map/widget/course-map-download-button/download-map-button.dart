import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
Future<void> downloadImage(BuildContext context, String imageUrl) async {
  try {
    var response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Get the app's document directory to save the image
      var appDocDir = await getApplicationDocumentsDirectory();
      String fileName = imageUrl.split('/').last;
      String filePath = '${appDocDir.path}/$fileName';

      // Write the file to the device's file system
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      // Show a dialog indicating successful download
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Download Complete'),
          content: Text('The image has been downloaded successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      print('Failed to download image. Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading image: $e');
  }
}
