import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userdashboard extends StatefulWidget {
  final String username;
  final String password;
  final String loginTime;

  const userdashboard(
      {Key? key,
      required this.username,
      required this.password,
      required this.loginTime})
      : super(key: key);

  @override
  State<userdashboard> createState() => _userdashboardState();
}

class _userdashboardState extends State<userdashboard> {
  @override
  void initState() {
    super.initState();
    _saveUserDashboardData();
  }

  Future<void> _saveUserDashboardData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user_dashboard_data', [
      widget.username,
      widget.password,
      widget.loginTime,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Username: ${widget.username}"),
            Text("Password: ${widget.password}"),
            Text("Login Time: ${widget.loginTime}"),
          ],
        ),
      ),
    );
  }
}
