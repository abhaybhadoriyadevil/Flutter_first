import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second/pages/home.dart';
import 'package:second/pages/profileadmin.dart';

class MyDrawer extends StatelessWidget {
  final AdminData adminData;

  const MyDrawer(this.adminData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(adminData.name),
                accountEmail: Text(adminData.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(adminData.profileImageUrl),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home, color: Colors.white),
              title: GestureDetector(
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  // Add your Home button action here
                  // For example, you can navigate to the home screen
                },
                child: const Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminProfilePage(adminData)),
                  );
                  // Add your Profile button action here
                  // For example, you can navigate to the profile screen
                },
                child: const Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  final adminData = AdminData(); // Initialize the admin's data

  runApp(MaterialApp(
    home: AdminProfilePage(adminData),
  ));
}