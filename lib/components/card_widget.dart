import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:spring/models/worker_model.dart';
import 'popup_info.dart';

class WorkerCard extends StatelessWidget {
  final Worker worker;

  WorkerCard({required this.worker});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopupInfo(worker: worker);
          },
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Color(0xFF388E3C), Color(0xFF2E7D32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                worker.name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                '${worker.location} | ${worker.skills.join(', ')}',
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Score: ${worker.score}',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Text(
                    'Rank: ${worker.rank}',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
