import 'package:flutter/material.dart';

void main() {
  runApp(SiddaruApp());
}

class SiddaruApp extends StatelessWidget {
  const SiddaruApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siddaru',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    _textAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(-1.0, 0.0),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ಓಘ ಸಿದ್ಧೇಶ್ವರ ದೇವಸ್ಥಾನ ಮೋಳೆ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7), // Increase the opacity here (0.5 for 50% opacity)
              BlendMode.lighten, // Adjust the blend mode as per your preference
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16.0), // Add some space at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircularImageWithLabel('assets/image1.jpg', 'ಭೂತಾಳಿ ಸಿದ್ದರು'),
                _buildCircularImageWithLabel('assets/image2.jpg', 'ಸಿದ್ದೇಶ್ವರರು'),
                _buildCircularImageWithLabel('assets/image3.jpg', 'ಅಮೋಘ ಸಿದ್ದರು'),
              ],
            ),
            SizedBox(height: 16.0), // Add some space between the images
            Expanded(
              flex: 1,
              child: SlideTransition(
                position: _textAnimation,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'ಓಘಸಿದ್ದೇಶ್ವರ ದೇವಸ್ಥಾನ ಮೋಳೆ',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.amber,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: _buildColumnIcon('Events', 'assets/events.png'),
                  ),
                  Container(
                    child: _buildColumnIcon('Pooja', 'assets/pooja.png'),
                  ),
                  Container(
                    child: _buildColumnIcon('Gallery', 'assets/gallery.png'),
                  ),
                  Container(
                    child: _buildColumnIcon('Live Streaming', 'assets/live_stream.png'),
                  ),
                  Container(
                    child: _buildColumnIcon('Daily Quotes', 'assets/quotes.png'),
                  ),
                  Container(
                    child: _buildColumnIcon('Virtual Pooja', 'assets/virtual_pooja.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnIcon(String label, String iconPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // Handle button press here
          },
          icon: Image.asset(
            iconPath,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


  Widget _buildCircularImageWithLabel(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
