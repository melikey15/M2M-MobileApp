import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/chat_page.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/meeting_pages.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/notification.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';

class Variable {
  static int? currentUserId;
  void setCurrentUserId(int id) {
    currentUserId = id;
  }

  int? getCurrentUserId() {
    return currentUserId;
  }

  static int bottomBarIndex = 0;

  static List<Widget> sayfalar = [
    MainPage(),
    ProfilePage(
      nereyeId: Variable().getCurrentUserId(),
    ),
    //MeetPages(),
    //Notifications(),
    ChatPage(),
  ];
}
