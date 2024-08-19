import 'package:flutter/material.dart';
import 'package:spring/models/worker_model.dart';

class PopupInfo extends StatelessWidget {
  final Worker worker;

  PopupInfo({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(0xFF2E7D32),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              worker.name,
              style: TextStyle(fontSize: 24, color: Colors.greenAccent),
            ),
            SizedBox(height: 10),
            Text(
              'Location: ${worker.location}',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              'Contact: ${worker.contact}',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              'Skills: ${worker.skills.join(', ')}',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              'Score: ${worker.score}',
              style: TextStyle(color: Colors.greenAccent),
            ),
            Text(
              'Rank: ${worker.rank}',
              style: TextStyle(color: Colors.greenAccent),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
