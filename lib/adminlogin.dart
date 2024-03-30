import 'package:flutter/material.dart';
import 'package:task/admin%20dashboard.dart';

class adminlogin extends StatefulWidget {
  const adminlogin({super.key});

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Admin Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Admin Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (username == 'qwert' && password == 'trewq') {
                  print('Login successful');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => admindashboard()),
                  );
                } else {
                  print('Invalid username or password');
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
