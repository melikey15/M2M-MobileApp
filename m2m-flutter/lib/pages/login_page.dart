import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/global.dart';
import 'package:m2m_flutter_main/model/login_request_model.dart';
import 'package:m2m_flutter_main/model/login_response_model.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../common/theme_helper.dart';

import 'main_page.dart';
import 'registiration_page.dart';
import 'package:m2m_flutter_main/pages/widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 300;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 237, 252),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    //crossAxisAlignment: Alignment(0.5, 0.5),
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: Text(
                          'Hi There!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 50, 28, 49),
                              height: 0.1,
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      //Spacer(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Now it\'s easy to find mentor,just create an account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 50, 28, 49),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'E-mail address', 'Enter your email'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your email";
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 25.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );*/
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 36, 19, 35),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (validateAndSave()) {
                                      setState(() {
                                        //isAPIcallProcess = true;
                                      });

                                      LoginRequestModel model =
                                          LoginRequestModel(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);

                                      APIService.login(model).then((response) =>
                                          {
                                            if (response.userWithEmail != null)
                                              {
                                                Variable().setCurrentUserId(
                                                    response.userWithEmail!.id),
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  '/home',
                                                  (route) => false,
                                                )
                                              }
                                            else
                                              {
                                                //Hata mesajı gösterilecek
                                                FormHelper
                                                    .showSimpleAlertDialog(
                                                        context,
                                                        "Error",
                                                        response.message!,
                                                        "OK", () {
                                                  Navigator.pop(context);
                                                })
                                              }
                                          });
                                    }
                                    // if (_formKey.currentState!.validate()) {
                                    //   Navigator.of(context).pushAndRemoveUntil(
                                    //       MaterialPageRoute(
                                    //           builder: (context) => MainPage()),
                                    //       (Route<dynamic> route) => false);
                                    // }
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          '/register',
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
