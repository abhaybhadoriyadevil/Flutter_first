// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:second/pages/profileadmin.dart';
import 'package:second/utility/routes.dart';
import 'package:second/widgets/drawers.dart';

class adminpage extends StatefulWidget {
  const adminpage({Key? key});

  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
  // Define a list of button labels and route names
  final List<String> buttonLabels = [
    'Current User',
    'Products',
    'Sells',
    'Unable Products',
  ];

  final List<String> routeNames = [
    MyRoutes.Cuserroute,
    MyRoutes.productroute,
    MyRoutes.sellsroute,
    MyRoutes.unproductroute,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G-sells', style: TextStyle(color: Colors.indigo, fontSize: 32)),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: List.generate(
            buttonLabels.length,
            (index) => buildContainerWithButton(
              buttonLabels[index],
              () => navigateToRoute(routeNames[index]),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(AdminData()),
    );
  }

  void navigateToRoute(String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  Widget buildContainerWithButton(String label, void Function() action) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo, // Set your desired color
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
