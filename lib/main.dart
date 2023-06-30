import 'package:flutter/material.dart';

void main() {
  runApp(SiddaruApp());
}

class SiddaruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siddaru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ogha Siddeshwar Honna Mole'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo and App Name
            Container(
              // Place your logo widget here
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 16),
            // Welcome Message
            Text(
              'Welcome to Shri Siddeshwar Temple Mole!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Menu or Navigation Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Events feature
                  },
                  child: Text('Events'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Pooja feature
                  },
                  child: Text('Pooja'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Donations feature
                  },
                  child: Text('Donations'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle History feature
                  },
                  child: Text('History'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Daily Schedule feature
                  },
                  child: Text('Daily Schedule'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Featured Content
            Container(
              // Place your featured content widget here
              child: Text('Featured Content'),
            ),
            SizedBox(height: 16),
            // Quick Links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Live Streaming feature
                  },
                  child: Text('Live Streaming'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Daily Quotes feature
                  },
                  child: Text('Daily Quotes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Virtual Pooja feature
                  },
                  child: Text('Virtual Pooja'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Image or Video Slideshow
            Container(
              // Place your slideshow widget here
              child: Text('Image or Video Slideshow'),
            ),
            SizedBox(height: 16),
            // Search Functionality
            Container(
              // Place your search widget here
              child: Text('Search Functionality'),
            ),
            SizedBox(height: 16),
            // Social Media Integration
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle Facebook integration
                  },
                  icon: Icon(Icons.facebook),
                ),
                IconButton(
                  onPressed: () {
                    // Handle Instagram integration
                  },
                  icon: Icon(Icons.camera_alt),
                ),
                IconButton(
                  onPressed: () {
                    // Handle Twitter integration
                  },
                  icon: Icon(Icons.chat),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Contact Information
            Column(
              children: [
                Text('Contact Information:'),
                Text('Siddaru Temple, 123 Main St, City'),
                Text('Phone: +1 123-456-7890'),
                Text('Email: info@siddaru-temple.com'),
              ],
            ),
            SizedBox(height: 16),
            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle About Us
                  },
                  child: Text('About Us'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle Terms of Service
                  },
                  child: Text('Terms of Service'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle Privacy Policy
                  },
                  child: Text('Privacy Policy'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle FAQs
                  },
                  child: Text('FAQs'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
