import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/mentee_page.dart';
import 'pages/registiration_page.dart';
import 'pages/add_task_bar_page.dart';

Widget _defaultHome = LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool result = await SharedService.isLoggedIn();
  if (result) {
    _defaultHome = BottomBar(
      indexId: 0,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color.fromARGB(255, 111, 116, 165), //10%
    100: Color.fromARGB(255, 203, 205, 223), //20%
    200: Color.fromARGB(255, 176, 179, 201), //30%
    300: Color.fromARGB(255, 219, 220, 231), //40%
    400: Color.fromARGB(255, 142, 144, 165), //50%
    500: Color.fromARGB(255, 106, 107, 117), //60%
    600: Color.fromARGB(255, 84, 88, 125), //70%
    700: Color.fromARGB(255, 88, 90, 110), //80%
    800: Color.fromARGB(255, 136, 103, 134), //90%
    900: Color.fromARGB(255, 62, 35, 60), //100%
  };
  Color _primaryColor = Color.fromARGB(255, 217, 165, 181);
  Color accentColor = Color.fromARGB(255, 126, 122, 169);
  Color backColor = Color.fromARGB(255, 231, 236, 251);
  MaterialColor primeColor = MaterialColor(0xFF3399FF, color);

  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        dividerColor: Colors.black,
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(backgroundColor: _primaryColor),
        primaryColor: Color.fromARGB(255, 217, 165, 181),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        scaffoldBackgroundColor: Color.fromARGB(255, 121, 117, 163),
        primaryColorDark: Color.fromARGB(255, 0, 0, 0),
        primarySwatch: primeColor,
      ),
      // home: SplashScreen(title: 'Flutter Login'),
      //home: LoginPage(),
      routes: {
        '/': (context) => _defaultHome,
        '/home': (context) => BottomBar(
              indexId: 0,
            ),
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegistrationPage(),
      },
    );
  }
}
