import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/global.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';

class BottomBar extends StatefulWidget {
  final int indexId;

  const BottomBar({Key? key, required this.indexId}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    Variable.bottomBarIndex = widget.indexId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Variable.sayfalar[Variable.bottomBarIndex],
      bottomNavigationBar: bottomBar(),
    );
  }

  void _onTap(int index) {
    print(index);
    setState(() {
      Variable.bottomBarIndex = index;
    });
  }

  Widget bottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 231, 236, 251),
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],
      currentIndex: Variable.bottomBarIndex,
      selectedItemColor: Color.fromARGB(255, 180, 113, 176),
      unselectedItemColor: Color.fromARGB(255, 100, 98, 98),
      // backgroundColor: Color.fromARGB(255, 255, 169, 143),
      onTap: _onTap,
      elevation: 17,
    );
  }
}
