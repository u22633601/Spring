import 'package:flutter/material.dart';
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
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[800],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            worker.name,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          subtitle: Text(
            '${worker.location} | ${worker.skills.join(', ')}',
            style: TextStyle(color: Colors.black54),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: ${worker.score}',
                style: TextStyle(color: Colors.green[800]),
              ),
              Text(
                'Rank: ${worker.rank}',
                style: TextStyle(color: Colors.green[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
