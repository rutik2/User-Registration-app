import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration App',
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  String feedbackMessage = '';

  void submitRegistration() {
    if (validateInputs()) {
      print('User Registered:');
      print('First Name: ${firstNameController.text}');
      print('Last Name: ${lastNameController.text}');
      print('Phone Number: ${phoneNumberController.text}');
      print('Address: ${addressController.text}');
      print('Date of Birth: ${dobController.text}');
      setState(() {
        feedbackMessage = '''Registration Successful
        Thank You!''';
      });
    } else {
      setState(() {
        feedbackMessage = 'Please fill in all fields with valid information.';
      });
    }
  }

  bool validateInputs() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        dobController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name',border: OutlineInputBorder(),prefixIcon: Icon(Icons.person_outline_outlined)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name',border: OutlineInputBorder(),prefixIcon: Icon(Icons.person_outline_outlined)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number',border: OutlineInputBorder(),prefixIcon: Icon(Icons.phone)),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address',border: OutlineInputBorder(),prefixIcon: Icon(Icons.home_outlined)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextField(
                  controller: dobController,
                  decoration: const InputDecoration(labelText: 'Date of Birth',border: OutlineInputBorder(),prefixIcon: Icon(Icons.calendar_month)),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: ElevatedButton(
                  onPressed: submitRegistration ,
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text('Submit',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                feedbackMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}