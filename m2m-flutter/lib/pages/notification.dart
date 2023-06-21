import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import '../common/Listing.dart';
import 'package:http/http.dart';
import '../model/getByRole_model.dart';

import 'login_page.dart';
import 'main_page.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List _notifications = [
    'notification 1',
    'notification2 ',
    'notification 3',
    'notification 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "Yeni bir mentee takip etti",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                )
                //leading: Icon,

                ,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "Yeni bir puan aldınız",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                )
                //leading: Icon,

                ,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                //leading: Icon      ,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                //leading: Icon,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                //leading: Icon,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ), //leading: Icon,
              ),
              _buildDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "assşfdgfdki",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active_rounded,
                    size: 25,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                //leading: Icon,
              ),
            ],
          ),
        ),
      ]),

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Notification Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      drawer: DrawerHelp(),
      // bottomNavigationBar: BottomBar(),
    );
  }
}

Widget ListViewItem(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefixIcon(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message(index),
                timeAndData(index),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget prefixIcon() {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 54, 31, 53),
    ),
    child: Icon(
      Icons.notifications_active_rounded,
      size: 25,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  );
}

Widget message(int index) {
  double textSize = 16;
  return Container(
    child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: 'Message',
            style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Message Description',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ])),
  );
}

Widget timeAndData(int index) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat.yMMMMd().format(DateTime.now()),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          DateFormat.yMMMMd().format(DateTime.now()),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Container _buildDivider() {
  return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Color.fromARGB(255, 158, 118, 187));
}
