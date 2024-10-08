import 'package:flutter/material.dart';
import 'package:spring/models/worker_model.dart';
import 'package:spring/services/supabase_service.dart';

class RegisterWorkerScreen extends StatefulWidget {
  @override
  _RegisterWorkerScreenState createState() => _RegisterWorkerScreenState();
}

class _RegisterWorkerScreenState extends State<RegisterWorkerScreen> {
  final _formKey = GlobalKey<FormState>();
  final SupabaseService _supabaseService = SupabaseService();

  String? _name;
  String? _location;
  String? _contact;
  List<String> _skills = [];
  double _score = 0;
  int _rank = 0;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newWorker = Worker(
        id: '', // ID will be generated by Supabase
        name: _name!,
        location: _location!,
        contact: _contact!,
        skills: _skills,
        score: _score,
        rank: _rank,
        averageRating: 0,
        ratingCount: 0,
      );

      try {
        await _supabaseService.addWorker(newWorker);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Worker added successfully!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add worker: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register a Worker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                label: 'Name & Surname',
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Location',
                onSaved: (value) => _location = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Contact',
                onSaved: (value) => _contact = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a contact number';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Skills (comma separated)',
                onSaved: (value) {
                  _skills = value!.split(',').map((e) => e.trim()).toList();
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register Worker'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required FormFieldSetter<String> onSaved,
    FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green[800]),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
