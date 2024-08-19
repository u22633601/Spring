import 'package:flutter/material.dart';

class JobListingsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _mockJobs = [
    {
      'title': 'House Painting',
      'description': 'Need experienced painter for interior house painting',
      'location': 'New York, NY',
      'budget': '\$500',
    },
    {
      'title': 'Gardening and Landscaping',
      'description': 'Looking for a gardener to maintain our backyard',
      'location': 'Los Angeles, CA',
      'budget': '\$200',
    },
    {
      'title': 'Plumbing Repair',
      'description': 'Fix leaky faucet and replace bathroom sink',
      'location': 'Chicago, IL',
      'budget': '\$150',
    },
    // Add more mock job listings as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement job filtering
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _mockJobs.length,
        itemBuilder: (context, index) {
          final job = _mockJobs[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                job['title'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(job['description']),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16),
                      SizedBox(width: 4),
                      Text(job['location']),
                      Spacer(),
                      Text(
                        job['budget'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // TODO: Implement job details page navigation
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Implement job posting functionality
        },
        tooltip: 'Post a Job',
      ),
    );
  }
}