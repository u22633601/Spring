import 'package:flutter/material.dart';
import 'package:spring/worker_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> allWorkers = [
    {'name': 'Dave Smith', 'job': 'Painter', 'rating': 4.5, 'image': 'assets/dave.jpg'},
    {'name': 'Rob Johnson', 'job': 'Gardener', 'rating': 4.8, 'image': 'assets/rob.jpeg'},
    {'name': 'Susan Brown', 'job': 'Electrician', 'rating': 4.2, 'image': 'assets/Susan.jpg'},
    {'name': 'Mike Wilson', 'job': 'Plumber', 'rating': 4.6, 'image': 'assets/dave.jpg'},
    {'name': 'Emily Davis', 'job': 'Carpenter', 'rating': 4.3, 'image': 'assets/Susan.jpg'},
    {'name': 'Chris Taylor', 'job': 'Landscaper', 'rating': 4.7, 'image': 'assets/rob.jpeg'},
    {'name': 'Lisa Anderson', 'job': 'Interior Designer', 'rating': 4.9, 'image': 'assets/Susan.jpg'},
    {'name': 'Tom Harris', 'job': 'Handyman', 'rating': 4.4, 'image': 'assets/dave.jpg'},
    {'name': 'Sarah Miller', 'job': 'House Cleaner', 'rating': 4.5, 'image': 'assets/Susan.jpg'},
    {'name': 'John White', 'job': 'HVAC Technician', 'rating': 4.6, 'image': 'assets/rob.jpeg'},
    {'name': 'Rachel Green', 'job': 'Window Cleaner', 'rating': 4.3, 'image': 'assets/Susan.jpg'},
    {'name': 'Daniel Lee', 'job': 'Roofer', 'rating': 4.7, 'image': 'assets/dave.jpg'},
    {'name': 'Dave Smith', 'job': 'Painter', 'rating': 4.5, 'image': 'assets/dave.jpg'},
    {'name': 'Rob Johnson', 'job': 'Gardener', 'rating': 4.8, 'image': 'assets/rob.jpeg'},
    {'name': 'Susan Brown', 'job': 'Electrician', 'rating': 4.2, 'image': 'assets/Susan.jpg'},
    {'name': 'Mike Wilson', 'job': 'Plumber', 'rating': 4.6, 'image': 'assets/dave.jpg'},
    {'name': 'Emily Davis', 'job': 'Carpenter', 'rating': 4.3, 'image': 'assets/Susan.jpg'},
    {'name': 'Chris Taylor', 'job': 'Landscaper', 'rating': 4.7, 'image': 'assets/rob.jpeg'},
    {'name': 'Lisa Anderson', 'job': 'Interior Designer', 'rating': 4.9, 'image': 'assets/Susan.jpg'},
    {'name': 'Tom Harris', 'job': 'Handyman', 'rating': 4.4, 'image': 'assets/dave.jpg'},
    {'name': 'Sarah Miller', 'job': 'House Cleaner', 'rating': 4.5, 'image': 'assets/Susan.jpg'},
    {'name': 'John White', 'job': 'HVAC Technician', 'rating': 4.6, 'image': 'assets/rob.jpeg'},
    {'name': 'Rachel Green', 'job': 'Window Cleaner', 'rating': 4.3, 'image': 'assets/Susan.jpg'},
    {'name': 'Daniel Lee', 'job': 'Roofer', 'rating': 4.7, 'image': 'assets/dave.jpg'},
  ];

  List<Map<String, dynamic>> displayedWorkers = [];
  String searchQuery = '';
  String selectedJob = 'All';

  @override
  void initState() {
    super.initState();
    displayedWorkers = allWorkers;
  }

  void filterWorkers() {
    setState(() {
      displayedWorkers = allWorkers.where((worker) {
        final nameMatches = worker['name'].toLowerCase().contains(searchQuery.toLowerCase());
        final jobMatches = selectedJob == 'All' || worker['job'] == selectedJob;
        return nameMatches && jobMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Set<String> uniqueJobs = {'All', ...allWorkers.map((w) => w['job'] as String)};

    return Scaffold(
      appBar: AppBar(
        title: Text('Spring'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search workers...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery = value;
                    filterWorkers();
                  },
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: uniqueJobs.map((job) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(job),
                        selected: selectedJob == job,
                        onSelected: (selected) {
                          setState(() {
                            selectedJob = selected ? job : 'All';
                            filterWorkers();
                          });
                        },
                      ),
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 7 : 3,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: displayedWorkers.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: MediaQuery.of(context).size.width > 600 ? 7 : 3,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: WorkerCard(worker: displayedWorkers[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}