import 'package:flutter/material.dart';
import 'package:spring/services/toast_service.dart';

class RegisterWorkerScreen extends StatefulWidget {
  @override
  _RegisterWorkerScreenState createState() => _RegisterWorkerScreenState();
}

class _RegisterWorkerScreenState extends State<RegisterWorkerScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? municipality;
  String? phoneNumber;
  String? serviceCategory;
  String? additionalSkills;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ToastService.showToast("Worker registered successfully!", color: Colors.green);
      // Handle form submission logic here
    } else {
      ToastService.showToast("Please correct the errors in the form.");
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => name = value,
              ),
              _buildTextField(
                label: 'Select Your Municipality',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a municipality';
                  }
                  return null;
                },
                onSaved: (value) => municipality = value,
              ),
              _buildTextField(
                label: 'Enter Your Cell Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a cell number';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) => phoneNumber = value,
              ),
              _buildTextField(
                label: 'Select Your Service Category',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a service category';
                  }
                  return null;
                },
                onSaved: (value) => serviceCategory = value,
              ),
              _buildTextField(
                label: 'List Any Additional Skills You Have (Optional)',
                validator: (value) => null, // Optional field, no validation needed
                onSaved: (value) => additionalSkills = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register Worker'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
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
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.tealAccent),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.tealAccent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
