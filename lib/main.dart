import 'package:flutter/material.dart';
import 'package:second/Admin(Boss)/Current_user.dart';
import 'package:second/Admin(Boss)/adminpage.dart';
import 'package:second/Admin(Boss)/products.dart';
import 'package:second/Admin(Boss)/sells.dart';
import 'package:second/Admin(Boss)/unableproducts.dart';
import 'package:second/core/store.dart';
import 'package:second/pages/admin_login.dart';
import 'package:second/pages/cart_page.dart';
import 'package:second/pages/home.dart';
import 'package:second/pages/loginpage.dart';
import 'package:second/pages/profileadmin.dart';
import 'package:second/utility/routes.dart';
import 'package:second/widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //inherite function
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MYtheme.lightTheme(context),
      darkTheme: MYtheme.DarkTheme(context),
      initialRoute: MyRoutes.AdminpageRoute,
      routes: {
        "/": (context) => const Login(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const Login(),
        MyRoutes.CartRoute: (context) => const CartPage(),
        MyRoutes.AdminRoute: (context) => const Admin(),
        MyRoutes.AdminpageRoute: (context) => const adminpage(),
        MyRoutes.AdminProfilePage: (context) =>AdminProfilePage(AdminData()),
        MyRoutes.Cuserroute: (context) =>const Cuser(),
        MyRoutes.productroute: (context) =>const product(),
        MyRoutes.sellsroute: (context) =>const sells(),
        MyRoutes.unproductroute: (context) =>const unproduct(),

      },
    );
  }
}
