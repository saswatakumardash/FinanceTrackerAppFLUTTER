// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              "Your Account",
              style: TextStyle(
                  color: Colors.orangeAccent.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/jsr2.jpeg'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text(
                "Namaste Saswata Kumar Dash!",
                style: TextStyle(
                    color: Colors.lightBlue[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 22,
                    color: Colors.blueAccent,
                  ),
                  title: Text("Your Profile"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.payment_outlined,
                    size: 22,
                    color: Colors.blue,
                  ),
                  title: Text("Your Banking Details"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.loyalty,
                    size: 22,
                    color: Colors.blue,
                  ),
                  title: Text("Your Subscription"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.group,
                    size: 22,
                    color: Colors.blue,
                  ),
                  title: Text("Your Referrer Program"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    size: 22,
                    color: Colors.blue,
                  ),
                  title: Text("QUERIES"),
                  trailing: Icon(Icons.question_mark),
                ),
                Divider(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent)),
              onPressed: () {},
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
