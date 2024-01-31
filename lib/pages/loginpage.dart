// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:second/utility/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/login.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "welcome $name",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: " Enter UserName",
                          labelText: "UserName",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: " Enter Password", labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "passward cannot be empty";
                          } else if (value.length < 6) {
                            return "passward length should be 6 atleast";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: context.accentColor,
                        //shape: changeButton
                        //? BoxShape.circle : BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),

                        child: InkWell(
                          //splashColor: Colors.red,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                //shape: changeButton
                                //? BoxShape.circle : BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50 : 8)),
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),
                      //decoration: BoxDecoration(
                      //     color: Colors.deepPurple,
                      //   //shape: changeButton
                      // //? BoxShape.circle : BoxShape.rectangle,
                      //borderRadius: BorderRadius.circular(changeButton ? 50 : 8)
                      //),
                      ElevatedButton(
                      style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
                      onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.AdminRoute);
                      },
                      child: const Text("Admin login"),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
