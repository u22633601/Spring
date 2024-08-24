import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:spring/models/worker_model.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // Fetch all workers
  Future<List<Worker>> fetchWorkers() async {
    final response = await _client
        .from('workers')
        .select()
        .execute();

    // Handle errors
    if (response.status != 200) {
      throw Exception('Failed to load workers:Unknown error 1');
    }

    // Parse the response data
    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((worker) => Worker.fromJson(worker)).toList();
  }

  // Insert a new worker
  Future<void> addWorker(Worker worker) async {
    final response = await _client.from('workers').insert({
      'name': worker.name,
      'location': worker.location,
      'contact': worker.contact,
      'skills': worker.skills,
      'score': worker.score,
      'rank': worker.rank,
      'average_rating': worker.averageRating,
      'rating_count': worker.ratingCount,
    }).execute();

    // Handle errors
    if (response.status != 201) {
      throw Exception('Failed to add worker: Unknown error 2');
    }
  }

  // Update a worker’s rating
   Future<void> updateWorkerRating(String id, double newRating, int newRatingCount) async {
print('Updating worker with id: $id');
    print('New rating: $newRating, New rating count: $newRatingCount');

    final response = await _client
        .from('workers')
        .update({
          'average_rating': newRating,
          'rating_count': newRatingCount,
        })
        .eq('id', id)
        .execute();

    print('Response data: ${response.data}');
    print('Response error: ${response}');
    // Handle errors
    if (response.status != 200) {
      throw Exception('Failed to update rating:Unknown error 3');
    }
  }
}
