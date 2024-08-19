import 'package:flutter/material.dart';

class SkillsDevelopmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills Development'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Popup?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'A "Workshop" is any formal place of employment which is overseen/managed by any kind of floor manager.',
            ),
            SizedBox(height: 20),
            Text(
              'Why List My Workshop?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'In order to help young or older individuals develop new skills, we need employers/managers who are willing to open their place of work for such individuals to come and learn free of charge.',
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Employer Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle workshop listing logic
              },
              child: Text('List Workshop'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
