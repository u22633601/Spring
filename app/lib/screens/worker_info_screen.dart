import 'package:flutter/material.dart';
import 'package:spring/models/worker_model.dart';

class WorkerInfoScreen extends StatelessWidget {
  final Worker worker;

  WorkerInfoScreen({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(worker.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${worker.name}'),
            Text('Location: ${worker.location}'),
            Text('Contact: ${worker.contact}'),
            Text('Skills: ${worker.skills.join(', ')}'),
            Text('Score: ${worker.score}'),
            Text('Rank: ${worker.rank}'),
            // Add more details here...
          ],
        ),
      ),
    );
  }
}
