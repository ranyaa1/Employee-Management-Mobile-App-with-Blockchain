import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatefulWidget {
  @override
  _EmployeeProfilePageState createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  String _name = 'John Doe';
  String _position = 'Software Engineer';
  String _address = '123 Main St, Anytown, USA';
  String _imageUrl =
      'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(_imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              _name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _position,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _address,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Add edit profile functionality
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}


