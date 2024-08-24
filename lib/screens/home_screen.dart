import 'package:flutter/material.dart';
import 'package:spring/components/category_button.dart';
import 'package:spring/components/card_widget.dart';
import 'package:spring/components/navbar.dart';
import 'package:spring/models/worker_model.dart';
import 'package:spring/services/supabase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Worker> filteredWorkers = [];
  String searchQuery = '';
  String selectedCategory = 'All';
  final SupabaseService _supabaseService = SupabaseService();

  @override
  void initState() {
    super.initState();
    _loadWorkers();
  }

  Future<void> _loadWorkers() async {
    final workers = await _supabaseService.fetchWorkers();
    setState(() {
      filteredWorkers = workers;
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filterWorkers();
    });
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
      filterWorkers();
    });
  }

  void filterWorkers() {
    setState(() {
      filteredWorkers = filteredWorkers.where((worker) {
        final matchesCategory = selectedCategory == 'All' ||
            worker.skills.contains(selectedCategory);
        final matchesSearch = worker.name
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Spring'),
      drawer: Drawer(
        child: Container(
          color: Colors.green[800],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.green[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  'Spring Menu',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildDrawerItem(context, 'Home', '/'),
              _buildDrawerItem(context, 'Register a Worker', '/registerWorker'),
              _buildDrawerItem(context, 'Skills Development', '/skillsDevelopment', ),
              _buildDrawerItem(context, 'Rate a worker', '/rateWorker'),
              _buildDrawerItem(context, 'My Information', '/myInformation'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                               onChanged: updateSearchQuery,
                 style: TextStyle(color: Colors.black),
                 decoration: InputDecoration(
                   hintText: 'Search workers...',
                   hintStyle: TextStyle(color: Colors.black54),
                   prefixIcon: Icon(Icons.search, color: Colors.black54),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.greenAccent),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.greenAccent),
                   ),
                 ),
               ),
               SizedBox(height: 20),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     CategoryButton(
                       category: 'All',
                       isSelected: selectedCategory == 'All',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Domestic Help',
                       isSelected: selectedCategory == 'Domestic Help',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Gardeners',
                       isSelected: selectedCategory == 'Gardeners',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Construction',
                       isSelected: selectedCategory == 'Construction',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Till Workers',
                       isSelected: selectedCategory == 'Till Workers',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Petrol Help',
                       isSelected: selectedCategory == 'Petrol Help',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Housekeeping',
                       isSelected: selectedCategory == 'Housekeeping',
                       onPressed: updateCategory,
                     ),
                     CategoryButton(
                       category: 'Childcare',
                       isSelected: selectedCategory == 'Childcare',
                       onPressed: updateCategory,
                     ),
                     // Add more categories if needed
                   ],
                 ),
               ),
               SizedBox(height: 20),
               Expanded(
                 child: filteredWorkers.isEmpty
                     ? Center(child: CircularProgressIndicator())
                     : ListView.builder(
                         itemCount: filteredWorkers.length,
                         itemBuilder: (context, index) {
                           return WorkerCard(worker: filteredWorkers[index]);
                         },
                       ),
               ),
             ],
           ),
         ),
       );
     }

     ListTile _buildDrawerItem(BuildContext context, String title, String route) {
       return ListTile(
         title: Text(
           title,
           style: TextStyle(color: Colors.white),
         ),
         onTap: () {
           Navigator.pushNamed(context, route);
         },
       );
     }
   }

