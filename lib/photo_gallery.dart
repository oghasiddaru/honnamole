import 'package:flutter/material.dart';
class PhotoGalleryPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/photo1.jpg',
    'assets/images/photo2.jpg',
    'assets/images/photo3.jpg',
    // Add more image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(imagePaths.length, (index) {
          return GestureDetector(
            onTap: () {
              // Handle image tap event, e.g., display in full-screen view
            },
            child: Card(
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
