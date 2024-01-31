// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Cuser extends StatelessWidget {
  const Cuser({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current users',style: TextStyle(color: Colors.indigo, fontSize: 32)),
    
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack fill the entire screen
        children: <Widget>[
          // Background image
          Image.network('https://www.shareicon.net/data/2015/07/04/64248_users_256x256.png', // Replace with your image path
            fit: BoxFit.cover, // Adjust the BoxFit property as needed
          ),
          // Your content goes here
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your Content Here',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                // Add more widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
