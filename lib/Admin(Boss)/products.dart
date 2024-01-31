// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class product extends StatelessWidget {
  const product({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products',style: TextStyle(color: Colors.indigo, fontSize: 32)),
    
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack fill the entire screen
        children: <Widget>[
          // Background image
          Image.network('https://www.shutterstock.com/image-vector/human-hands-holding-cube-vector-260nw-628135430.jpg', // Replace with your image path
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
