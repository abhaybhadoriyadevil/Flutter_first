// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AdminData {
  String name;
  String email;
  String profileImageUrl;

  AdminData({
    this.name = 'Admin Name',
    this.email = 'admin@example.com',
    this.profileImageUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkyrfCT1JQphCLlv8N5mMrW9S1_Yes78nTmQ&usqp=CAU',
  });
}

class AdminProfilePage extends StatefulWidget {
  final AdminData adminData;

  const AdminProfilePage(this.adminData, {super.key});

  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.adminData.name);
    emailController = TextEditingController(text: widget.adminData.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(widget.adminData.profileImageUrl),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.adminData.name = nameController.text;
                  widget.adminData.email = emailController.text;
                });
              },
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            // You can add options for changing the profile picture here.
          ],
        ),
      ),
    );
  }
}
