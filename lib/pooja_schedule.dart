import 'package:flutter/material.dart';

class PoojaSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Pooja Schedule'),
      ),
      body: ListView(
        children: [
          PoojaTimingCard(
            time: '6:00 AM',
            poojaName: 'Morning Pooja',
          ),
          PoojaTimingCard(
            time: '12:00 PM',
            poojaName: 'Afternoon Pooja',
          ),
          PoojaTimingCard(
            time: '6:00 PM',
            poojaName: 'Evening Pooja',
          ),
        ],
      ),
    );
  }
}

class PoojaTimingCard extends StatelessWidget {
  final String time;
  final String poojaName;

  const PoojaTimingCard({
    required this.time,
    required this.poojaName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          time,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        title: Text(
          poojaName,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
