// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'mainPages/AccountPage.dart';
import 'mainPages/HomePage.dart';
import 'mainPages/transactionsPage.dart';
import 'mainPages/upcomingTransactionsPage.dart';
import 'mainPages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finances Tracker App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: HomeNavigationPage(0),
        routes: {
          '/login': (context) => LoginPage(),
        });
  }
}

class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage(this.currentIndex);
  int currentIndex;

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  final screens = [
    LoginPage(),
    HomePage(),
    TransactionPage(),
    PastTransactionsPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: widget.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          unselectedItemColor: Colors.green,
          selectedItemColor: Colors.redAccent,
          currentIndex: widget.currentIndex,
          onTap: (index) => setState(() {
            widget.currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Upcoming"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Past"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        ));
  }
}
