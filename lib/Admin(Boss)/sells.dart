// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class sells extends StatelessWidget {
  const sells({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sells',style: TextStyle(color: Colors.indigo, fontSize: 32)),
    
      ),
      body: Stack(
        fit: StackFit.expand, // Make the stack fill the entire screen
        children: <Widget>[
          // Background image
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqTfbo-TiunE6Ay7eTGIJe6dkip_QHQdwEQ&usqp=CAU', // Replace with your image path
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
