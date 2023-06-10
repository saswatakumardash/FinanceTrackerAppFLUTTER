// ignore_for_file: prefer_const_constructors, file_names, unnecessary_import, unused_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print, must_be_immutable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneyapp_speed_code/mainPages/transactionsPage.dart';
import 'package:moneyapp_speed_code/mainPages/upcomingTransactionsPage.dart';

import '../lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/background.webp'))),
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 60, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        backgroundImage: AssetImage('assets/jsr2.jpeg'),
                      ),
                      ElevatedButton(
                        onPressed: (() => {}),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.yellow)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Payday in a week",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            )),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20, top: 15),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Total Balance To Spend",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "₹60069.55",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.yellow[700],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Planning Ahead",
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => TransactionPage())));
                      },
                      child: Text(
                        "-₹500000.26",
                        style: TextStyle(
                            color: Colors.yellow[700],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingTransactions.length,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      height: 50,
                      width: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                upcomingTransactions[index][0],
                                Text(
                                  upcomingTransactions[index][1],
                                  style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In ${upcomingTransactions[index][2].difference(DateTime.now()).inDays.toString()} days",
                                  style: TextStyle(
                                    color: Colors.yellow[500],
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Week's Expenses",
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "-₹16948.45",
                      style: TextStyle(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                )
              ],
            ),
          ),
          CalendarWeeklyView()
        ],
      ),
    ]));
  }
}

class CalendarWeeklyView extends StatefulWidget {
  CalendarWeeklyView();

  @override
  State<CalendarWeeklyView> createState() => _CalendarWeeklyViewState();
}

class _CalendarWeeklyViewState extends State<CalendarWeeklyView> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DateTime today = DateTime.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);

    Widget buildSegment(
        String dateAbr, String datenumber, BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * 0.9,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            dateAbr[0] + dateAbr[1].toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(datenumber, style: TextStyle(fontSize: 14)),
        ]),
      );
    }

    DateTime _now = DateTime.now();

    List<DateTime> dates = [
      _now,
      _now.subtract(const Duration(days: 8)),
      _now.subtract(const Duration(days: 7)),
      _now.subtract(const Duration(days: 6)),
      _now.subtract(const Duration(days: 5)),
      _now.subtract(const Duration(days: 4)),
      _now.subtract(const Duration(days: 3))
    ];

    DateTime _start = DateTime(dates[groupValue!.toInt()].year,
        dates[groupValue!.toInt()].month, dates[groupValue!.toInt()].day, 0, 0);
    DateTime _end = DateTime(
        dates[groupValue!.toInt()].year,
        dates[groupValue!.toInt()].month,
        dates[groupValue!.toInt()].day,
        23,
        59,
        59);

    Widget calendarBox(BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
            alignment: Alignment.center,
            child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: Colors.transparent,
                thumbColor: Colors.orangeAccent,
                padding: const EdgeInsets.all(5),
                groupValue: groupValue,
                children: {
                  0: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 8)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 8)))
                          .toString(),
                      context),
                  1: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 7)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 7)))
                          .toString(),
                      context),
                  2: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 6)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 6)))
                          .toString(),
                      context),
                  3: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 5)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 5)))
                          .toString(),
                      context),
                  4: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 4)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 4)))
                          .toString(),
                      context),
                  5: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 3)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 3)))
                          .toString(),
                      context),
                  6: buildSegment(
                      DateFormat.EEEE()
                          .format(today.subtract(const Duration(days: 2)))
                          .toString(),
                      DateFormat.d()
                          .format(today.subtract(const Duration(days: 2)))
                          .toString(),
                      context),
                },
                onValueChanged: (value) {
                  setState(() {
                    groupValue = value;
                    print(groupValue);
                  });
                })),
      );
    }

    return Column(
      children: [
        calendarBox(context),
        VerticalList(date: dates[groupValue!.toInt()])
      ],
    );
  }
}

class VerticalList extends StatefulWidget {
  VerticalList({required this.date});
  late DateTime date;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 5),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: pastTransactions.length,
        itemBuilder: (context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.orangeAccent, width: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: pastTransactions[index][0],
              title: Text(
                pastTransactions[index][1],
                style: TextStyle(color: Colors.orangeAccent),
              ),
              subtitle: Text(pastTransactions[index][3]),
              trailing: Text(DateFormat.MMMMEEEEd()
                  .format(pastTransactions[index][2])
                  .toString()),
            ),
          );
        });
  }
}
