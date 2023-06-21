import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/global.dart';
import 'package:m2m_flutter_main/model/ConnectRequestModel.dart';
import 'package:m2m_flutter_main/model/commentRequest_model.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/getComment_model.dart';
import 'package:m2m_flutter_main/model/message_model.dart';
import 'package:m2m_flutter_main/model/user.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import '../common/theme_helper.dart';

import 'package:http/http.dart';
import 'dart:typed_data';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final int? nereyeId;

  const ProfilePage({Key? key, required this.nereyeId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? ownerID;
  String? ownerImage;
  final commentController = TextEditingController();
  List<GetByIdModel> productsResponseFromJson(String str) =>
      List<GetByIdModel>.from(
          json.decode(str).map((x) => GetByIdModel.fromJson(x)));

  late Future<List<GetByIdModel>> futureGetByIdModel;
  Future<List<GetByIdModel>> fetchGetByIdModel(nereyeId) async {
    Uri url = Uri.http(
      '192.168.0.20:5000',
      '/api/getById/${jsonEncode(nereyeId)}',
    );

    final response = await get(Uri.parse(url.toString()));

    if (response.statusCode == 200) {
      return productsResponseFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<CommentModel> productsResponseFromJson1(String str) =>
      List<CommentModel>.from(
          json.decode(str).map((x) => CommentModel.fromJson(x)));

  late Future<List<CommentModel>> futureCommentModel;
  Future<List<CommentModel>> fetchCommentModel(nereyeId) async {
    Uri url1 = Uri.http(
      '192.168.0.20:5000',
      '/api/getComment/$nereyeId',
    );
    final response = await get(Uri.parse(url1.toString()));

    if (response.statusCode == 200) {
      return productsResponseFromJson1(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureGetByIdModel =
        fetchGetByIdModel(widget.nereyeId) as Future<List<GetByIdModel>>;
    futureCommentModel =
        fetchCommentModel(widget.nereyeId) as Future<List<CommentModel>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 251),
      //appBar: buildAppBar(context),
      drawer: DrawerHelp(),
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        actions: <Widget>[
          if (Variable().getCurrentUserId() == widget.nereyeId)
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                SharedService.loginDetails().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                              nereyeId: value,
                            ))));
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: FutureBuilder<List<GetByIdModel>>(
                future: futureGetByIdModel,
                builder: (context, i) {
                  if (i.hasData) {
                    ownerID = i.data?[0].id;
                    ownerImage = i.data?[0].avatar;
                    Uint8List _bytes;
                    _bytes = Base64Decoder().convert('${ownerImage}');
                    return ListView(
                      primary: false, //??
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 24),
                        ProfileWidget(
                          imagePath: _bytes,
                          onClicked: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                      nereyeId: ownerID,
                                    )));
                          },
                        ),
                        const SizedBox(height: 24),
                        buildName('${i.data?[0].name}', '${i.data?[0].surname}',
                            '${i.data?[0].work}', '${i.data?[0].city}'),
                        const SizedBox(
                          height: 24,
                          width: 10,
                        ),
                        if (Variable().getCurrentUserId() != widget.nereyeId)
                          TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.black,
                                ),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered))
                                      return Color.fromARGB(255, 160, 88, 227)
                                          .withOpacity(0.04);
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states.contains(MaterialState.pressed))
                                      return Color.fromARGB(255, 160, 88, 227)
                                          .withOpacity(0.12);
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                // if (i.data![0].userRole == 1) {
                                //   FormHelper.showSimpleAlertDialog(
                                //       context,
                                //       "Warning",
                                //       "You cannot do this...",
                                //       "OK", () {
                                //     Navigator.pop(context);
                                //   });

                                ConnectRequestModel model =
                                    ConnectRequestModel(userId: i.data![0].id);

                                APIService.connectUser(model)
                                    .then((response) => {
                                          if (response.follow != null)
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
                                              FormHelper.showSimpleAlertDialog(
                                                  context,
                                                  "Error",
                                                  response.msg!,
                                                  "OK", () {
                                                Navigator.pop(context);
                                              })
                                            }
                                        });

                                // if (_formKey.currentState!.validate()) {
                                //   Navigator.of(context).pushAndRemoveUntil(
                                //       MaterialPageRoute(
                                //           builder: (context) => MainPage()),
                                //       (Route<dynamic> route) => false);
                                // }
                              },
                              child: Container(child: Text('CONNECT'))),
                        NumbersWidget(average: i.data?[0].ratingAverage),
                        const SizedBox(height: 48),
                        buildAbout('${i.data?[0].aboutMe}'),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
                          child: Text(
                            'Comments',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Container(
              height: 200,
              child: FutureBuilder<List<CommentModel>>(
                future: futureCommentModel,
                builder: (context, i) {
                  if (i.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: i.data?.length,
                        itemBuilder: (context, index) {
                          const SizedBox(height: 10);

                          Divider(
                            height: 10,
                          );
                          return buildComment(
                              '${i.data?[index].authorCommentsName}',
                              '${i.data?[index].authorCommentsSurname}',
                              '${i.data?[index].commentContent}',
                              context);
                        });
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 40, 0),
              child: TextFormField(
                maxLength: 255,
                controller: commentController,
                decoration: ThemeHelper().textInputDecoration(
                    'Comment..', 'Enter Your Comment to This Mentor! '),
              ),
            ),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'Submit!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("çalış");
                    SharedService.loginDetails().then((value) =>
                        APIService.createComment(
                            value!,
                            CommentRequestModel(
                                commentContent: commentController.text,
                                ownerId: ownerID!,
                                authorId: value)));

                    FormHelper.showSimpleAlertDialog(
                        context, "Info", "Considering your comment.", "OK", () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildName(
    String name,
    String surname,
    String major,
    String city,
  ) =>
      Column(
        children: [
          Text(
            name + ' ' + surname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            major,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            city,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      );

  Widget buildAbout(String about) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

Widget buildComment(
    String name, String surname, String comment, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Color.fromARGB(224, 246, 225, 255),
      margin: EdgeInsets.only(
        left: 20,
        right: 16,
      ),
      height: 80,
      child: Text(
          style: TextStyle(fontSize: 20),
          name + '   ' + surname + '\n' + '-\t\t\t ' + comment),
    ),
  );
}

// comment kısmı için widget
// Widget buildComment(list ) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 4,
//             ),
//             Text(
//               about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       );
// }
