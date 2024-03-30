import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat for formatting date and time
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

import 'userdashboardpage.dart';

class userlogin extends StatefulWidget {
  const userlogin({Key? key}) : super(key: key);

  @override
  State<userlogin> createState() => _userloginState();
}

class _userloginState extends State<userlogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                DateTime now = DateTime.now();
                String formattedDate =
                    DateFormat('dd-MM-yyyy – kk:mm').format(now);

                if (username == 'barath' && password == 'saraan') {
                  print('Login successful');

                 
                  _saveLoginDetails(formattedDate);

             
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => userdashboard(
                            username: username,
                            password: password,
                            loginTime: formattedDate)),
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

  Future<void> _saveLoginDetails(String loginTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> loginTimes = prefs.getStringList('login_times') ?? [];

    loginTimes.add(loginTime);

    await prefs.setStringList('login_times', loginTimes);
  }
}
