import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/model/feedbackRequest_model.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/widgets/textfield_widget.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../common/theme_helper.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  List<bool> isTypeSelected = [false, false, false, true, true];

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final feedBackCategoryController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 237, 245),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Color.fromARGB(255, 248, 237, 245),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Full Name',
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your Full Name";
                    }
                    return null;
                  },
                  controller: nameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email*',
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your Email";
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                /*TextFieldWidget(
                label: 'Full Name',
                text: 'Name Surname',
                onChanged: (name) {},
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldWidget(
                label: 'Email',
                text: 'email',
                onChanged: (major) {},
              ),
              const SizedBox(
                height: 24,
              ),*/
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Please define the type of the feedback",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your Category";
                    }
                    return null;
                  },
                  controller: feedBackCategoryController,
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildFeedbackForm(),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Text(
                          "Submit".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              //isAPIcallProcess = true;
                            });

                            FeedBackRequestModel model = FeedBackRequestModel(
                                name: nameController.text,
                                email: emailController.text,
                                feedBackCategory:
                                    feedBackCategoryController.text,
                                message: messageController.text);

                            APIService.feedBack(model).then((response) => {
                                  if (response.success != null)
                                    {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/home',
                                        (route) => false,
                                      )
                                    }
                                  else
                                    {
                                      //Hata mesajı gösterilecek
                                      FormHelper.showSimpleAlertDialog(context,
                                          "Error", response.message, "OK", () {
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      color: Color.fromARGB(255, 235, 227, 227),
      height: 150,
      child: Stack(
        children: [
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromARGB(255, 44, 42, 42),
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            controller: messageController,
          ),
        ],
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
