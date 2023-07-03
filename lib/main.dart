import 'package:flutter/material.dart';
import 'upcoming_events.dart';
import 'pooja_schedule.dart';
import 'photo_gallery.dart';

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
        primarySwatch: Colors.blue,
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

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'EN'; // Default language is English

  List<String> _languages = [
    'EN', // English
    'KN', // Kannada
    'MH', // Marathi
  ];

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ogha Siddeshwar Honna Mole'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo and App Name
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Image.asset('assets/logo.png'),
                  ),
                  SizedBox(height: 16),
                  // Welcome Message
                  Text(
                    'Welcome to Shri Siddeshwar Temple Mole!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  // Language Selection Dropdown
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    onChanged: (value) => _changeLanguage(value!),
                    items:
                    _languages.map<DropdownMenuItem<String>>((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  // Menu or Navigation Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpcomingEventsPage(),
                            ),
                          );
                        },
                        child: Text('Events'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PoojaSchedulePage(),
                            ),
                          );
                        },
                        child: Text('Pooja'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoGalleryPage(),
                            ),
                          );
                        },
                        child: Text('Gallery'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  // Featured Content
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Featured Content',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer convallis metus ac enim malesuada consectetur. In condimentum lectus eu ipsum interdum lobortis. Nulla vitae lectus eget dolor commodo pharetra. Nulla facilisi.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
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
                  SizedBox(height: 32),
                  // Image or Video Slideshow
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text('Image or Video Slideshow'),
                  ),
                  SizedBox(height: 32),
                  // Search Functionality
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text('Search Functionality'),
                  ),
                  SizedBox(height: 32),
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
                  SizedBox(height: 32),
                  // Contact Information
                  Column(
                    children: [
                      Text(
                        'Contact Information:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Siddaru Temple, 123 Main St, City'),
                      Text('Phone: +1 123-456-7890'),
                      Text('Email: info@siddaru-temple.com'),
                    ],
                  ),
                  SizedBox(height: 32),
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
        },
      ),
    );
  }
}
