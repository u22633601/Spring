import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:spring/models/worker_model.dart';
import 'package:spring/services/supabase_service.dart';

class RateWorkerScreen extends StatefulWidget {
  @override
  _RateWorkerScreenState createState() => _RateWorkerScreenState();
}

class _RateWorkerScreenState extends State<RateWorkerScreen> {
  final SupabaseService _supabaseService = SupabaseService();
  List<Worker> _workers = [];
  Worker? _selectedWorker;
  double _newRating = 3;

  @override
  void initState() {
    super.initState();
    _fetchWorkers();
  }

  Future<void> _fetchWorkers() async {
    try {
      final workers = await _supabaseService.fetchWorkers();
      setState(() {
        _workers = workers;
      });
    } catch (e) {
      print('Error fetching workers: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load workers: $e')),
      );
    }
  }

  Future<void> _submitRating() async {
    if (_selectedWorker == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a worker to rate.')),
      );
      return;
    }

    try {
      // Calculate the new average rating
      double updatedAverageRating = ((_selectedWorker!.averageRating * _selectedWorker!.ratingCount) + _newRating) / (_selectedWorker!.ratingCount + 1);

      await _supabaseService.updateWorkerRating(
        _selectedWorker!.id,
        updatedAverageRating,
        _selectedWorker!.ratingCount + 1,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rating submitted successfully!')),
      );

      Navigator.pop(context);
    } catch (e) {
      print('Error submitting rating: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit rating: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Worker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildWorkerDropdown(),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.greenAccent,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _newRating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('Submit Rating'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkerDropdown() {
    return DropdownButtonFormField<Worker>(
      value: _selectedWorker,
      hint: Text('Select a worker', style: TextStyle(color: Colors.black)),
      items: _workers.map((worker) {
        return DropdownMenuItem<Worker>(
          value: worker,
          child: Text('${worker.name} (${worker.location})'),
        );
      }).toList(),
      onChanged: (Worker? newValue) {
        setState(() {
          _selectedWorker = newValue;
        });
      },
      decoration: InputDecoration(
        labelText: 'Worker',
        labelStyle: TextStyle(color: Colors.green[800]),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) => value == null ? 'Please select a worker' : null,
    );
  }
}
