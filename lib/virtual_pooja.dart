import 'package:flutter/material.dart';

class VirtualPoojaPage extends StatefulWidget {
  const VirtualPoojaPage({Key? key}) : super(key: key);

  @override
  _VirtualPoojaPageState createState() => _VirtualPoojaPageState();
}

class _VirtualPoojaPageState extends State<VirtualPoojaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
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
        title: Text('Virtual Pooja'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the god's image here
            Image.asset('assets/gods_image.png'),
            SizedBox(height: 16),
            // Display the arati button here
            ElevatedButton(
              onPressed: () {
                // Start the animation when the arati button is pressed
                _animationController.forward();
              },
              child: Text('Arati'),
            ),
            SizedBox(height: 16),
            // Display the rotating arati animation
            RotationTransition(
              turns: _animationController,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAratiLight(),
                    _buildAratiLight(),
                    _buildAratiLight(),
                    _buildAratiLight(),
                    _buildAratiLight(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAratiLight() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
      ),
    );
  }
}
