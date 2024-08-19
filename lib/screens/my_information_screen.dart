import 'package:flutter/material.dart';

class MyInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Information'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name & Surname'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Select Your Municipality'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Your Cell Number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Select Your Service Category'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Company Name (Optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save logic
              },
              child: Text('Save Information'),
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
