import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              worker.name,
              style: TextStyle(fontSize: 24, color: Colors.green[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Location: ${worker.location}',
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              'Contact: ${worker.contact}',
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              'Skills: ${worker.skills.join(', ')}',
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              'Score: ${worker.score}',
              style: TextStyle(color: Colors.green[800]),
            ),
            Text(
              'Rank: ${worker.rank}',
              style: TextStyle(color: Colors.green[800]),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: worker.averageRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.greenAccent,
              ),
              onRatingUpdate: (rating) {
                // Update worker's rating
                worker.ratingCount += 1;
                worker.averageRating =
                    ((worker.averageRating * (worker.ratingCount - 1)) + rating) /
                        worker.ratingCount;
                // Optionally add persistence logic here
              },
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
