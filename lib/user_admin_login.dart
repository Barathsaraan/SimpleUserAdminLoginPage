import 'package:flutter/material.dart';
import 'package:task/adminlogin.dart';
import 'package:task/userlogin.dart';

class useradmin extends StatefulWidget {
  const useradmin({super.key});

  @override
  State<useradmin> createState() => _useradminState();
}

class _useradminState extends State<useradmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User And Admin Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userlogin()),
                );
              },
              child: Text("User Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => adminlogin()),
                );
              },
              child: Text("Admin Login"),
            ),
          ],
        ),
      ),
    );
  }
}
