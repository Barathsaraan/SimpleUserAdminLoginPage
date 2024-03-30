import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  List<String> loginTimes = [];

  @override
  void initState() {
    super.initState();
    _getLoginTimes();
  }

  Future<void> _getLoginTimes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginTimes = prefs.getStringList('login_times') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
      ),
      body: ListView.builder(
        itemCount: loginTimes.length,
        itemBuilder: (context, index) {
          String loginTime = loginTimes[index];
          DateTime dateTime = DateFormat('dd-MM-yyyy – kk:mm').parse(loginTime);
          String formattedDateTime =
              DateFormat('dd-MM-yyyy kk:mm').format(dateTime);
          return ListTile(
            title: Text("Login Time: $formattedDateTime"),
          );
        },
      ),
    );
  }
}
