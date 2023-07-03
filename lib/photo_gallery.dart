import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ViewMode {
  Grid,
  Carousel,
}

class PhotoGalleryPage extends StatefulWidget {
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  ViewMode _viewMode = ViewMode.Grid;
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _loadImageAssets();
  }

  Future<void> _loadImageAssets() async {
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final manifestMap = Map<String, dynamic>.from(json.decode(manifestContent));

    final imagePaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/images/'))
        .where((String key) =>
    key.toLowerCase().endsWith('.jpg') ||
        key.toLowerCase().endsWith('.jpeg') ||
        key.toLowerCase().endsWith('.png'))
        .toList();

    setState(() {
      _images = imagePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  _viewMode == ViewMode.Grid ? Icons.grid_on : Icons.view_carousel,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _viewMode = _viewMode == ViewMode.Grid ? ViewMode.Carousel : ViewMode.Grid;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return _buildPhotoGallery(constraints.maxWidth);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGallery(double width) {
    if (_images.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    switch (_viewMode) {
      case ViewMode.Grid:
        return _buildGridView();
      case ViewMode.Carousel:
        return _buildCarouselView();
    }
  }

  Widget _buildGridView() {
    return GridView.custom(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _calculateCrossAxisCount(),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          final imagePath = _images[index];
          return GestureDetector(
            onTap: () {
              _navigateToImageDetail(index);
            },
            child: Hero(
              tag: imagePath,
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          );
        },
        childCount: _images.length,
      ),
    );
  }

  Widget _buildCarouselView() {
    return PageView.builder(
      itemCount: _images.length,
      itemBuilder: (context, index) {
        final imagePath = _images[index];
        return GestureDetector(
          onTap: () {
            _navigateToImageDetail(index);
          },
          child: Hero(
            tag: imagePath,
            child: Container(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.contain,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }

  int _calculateCrossAxisCount() {
    final width = MediaQuery.of(context).size.width;
    if (width >= 600) {
      return 4; // 4 images per row for larger screens
    } else if (width >= 400) {
      return 3; // 3 images per row for medium-sized screens
    } else {
      return 2; // 2 images per row for smaller screens
    }
  }

  void _navigateToImageDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailPage(
          imagePaths: _images,
          currentIndex: index,
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
              return Hero(
                tag: imagePath,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
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
