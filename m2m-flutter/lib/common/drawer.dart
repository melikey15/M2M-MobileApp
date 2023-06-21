import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/categories_page.dart';
import 'package:m2m_flutter_main/pages/favorites_page.dart';
import 'package:m2m_flutter_main/pages/feedback.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/meeting_pages.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/settings_page.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import '../pages/login_page.dart';
import '../pages/mentee_page.dart';
import '../pages/profile_page.dart';
import '../pages/splash_screen.dart';
import '../pages/registiration_page.dart';
import '../main.dart';
import 'package:flutter/services.dart';

import 'Bottom_Bar.dart';

class DrawerHelp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<DrawerHelp> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 241, 237, 252),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).copyWith().primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(0),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      SharedService.loginDetails()
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                        nereyeId: value,
                                      ))));
                    },
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 64, 46, 62),
                        radius: 32,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              'https://productimages.hepsiburada.net/s/40/1500/10650895351858.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {
                            SharedService.loginDetails()
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage(
                                              nereyeId: value,
                                            ))));
                          },
                          child: Text(
                            '\nMy Profile',
                            style: TextStyle(
                                fontSize: 23,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomBar(indexId: 0)),
                  (route) => false);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.meeting_room,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Meetings',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MeetPages()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Mentors',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentorPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Mentees',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenteePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Favorite',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (FavoritesPage())),
              );
            },
          ),
          Divider(
            color: Theme.of(context).secondaryHeaderColor,
            height: 2,
            thickness: 3,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.feedback_rounded,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Feedbaack',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedBack()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              SharedService.logout(context);
            },
          ),
          Container(
            height: 190,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/image/m2m.png"),
                colorFilter: new ColorFilter.mode(
                    Color.fromARGB(255, 241, 237, 252).withOpacity(0.3),
                    BlendMode.dstATop),
              ),
            ),
            // padding: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
