import 'dart:convert';

import 'package:flutter/material.dart';

class PhotoGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FutureBuilder<List<String>>(
            future: _loadImageAssets(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final images = snapshot.data!;
                return GridView.builder(
                  padding: EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _calculateCrossAxisCount(constraints.maxWidth),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final imagePath = images[index];
                    return GestureDetector(
                      onTap: () {
                        _navigateToImageDetail(context, images, index);
                      },
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading images.'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }

  Future<List<String>> _loadImageAssets(BuildContext context) async {
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final manifestMap = Map<String, dynamic>.from(json.decode(manifestContent));

    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/images/'))
        .where((String key) => key.endsWith('.jpg') || key.endsWith('.jpeg') || key.endsWith('.png'))
        .toList();

    return imagePaths;
  }

  int _calculateCrossAxisCount(double width) {
    if (width >= 600) {
      return 4; // 4 images per row for larger screens
    } else if (width >= 400) {
      return 3; // 3 images per row for medium-sized screens
    } else {
      return 2; // 2 images per row for smaller screens
    }
  }

  void _navigateToImageDetail(BuildContext context, List<String> imagePaths, int currentIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailPage(
          imagePaths: imagePaths,
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}

class ImageDetailPage extends StatefulWidget {
  final List<String> imagePaths;
  final int currentIndex;

  const ImageDetailPage({required this.imagePaths, required this.currentIndex});

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  late PageController _pageController;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final imagePath = widget.imagePaths[index];
              return Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _currentPageIndex > 0
                      ? () {
                    _navigateToPreviousImage();
                  }
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _currentPageIndex < widget.imagePaths.length - 1
                      ? () {
                    _navigateToNextImage();
                  }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPreviousImage() {
    _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _navigateToNextImage() {
    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
