import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/circle.dart';
import 'package:m2m_flutter_main/model/getAllTags_model.dart';
import 'package:m2m_flutter_main/model/getByRole_model.dart';
import 'package:m2m_flutter_main/model/getMyMentees_model.dart';
import 'package:m2m_flutter_main/model/getMyMentors_model.dart';
import 'package:m2m_flutter_main/model/message_model.dart';
import 'package:m2m_flutter_main/pages/categories_page.dart';
import 'package:m2m_flutter_main/pages/tag_mentors_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_task_bar_page.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'mentor_page.dart';
import 'notification.dart';
import 'splash_screen.dart';
import 'widgets/header_widget.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:http/http.dart';

import 'package:m2m_flutter_main/square.dart';
import 'registiration_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? selectedChip;
  String? selectedChipName;

  Future<List<GetMyMenteesModel>?> futureMyMentees = APIService.getMyMentees();
  Future<List<GetMyMentorsModel>?> futureMyMentors = APIService.getMyMentors();
  Future<List<GetAllTagsModel>?> futureGetTags = APIService.getAllTags();
  Future<List<GetByRoleModel>?> futureGetTop = APIService.getTop();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _userCard(
      String imageUrl, String name, String surname, double rating, int id) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color.fromARGB(233, 255, 255, 255),
            Color.fromARGB(255, 234, 226, 236),
          ],
        ),
        border: Border.all(
          color: Color.fromARGB(255, 231, 236, 251),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(1, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(nereyeId: id)));
            },
            child: ProfileWidget(
              imagePath: Base64Decoder().convert(imageUrl),
              onClicked: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ProfilePage(
                //           nereyeId: id,
                //         )));
              },
            ),
          ),
          Text(
            (name) + (' ') + (surname),
            style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Color.fromARGB(255, 217, 169, 25),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 237, 252),
      drawer: DrawerHelp(),
      appBar: AppBar(
        title: Text(
          "Main Page",
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
        //margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 180, 0),
                child: Text(
                  'My Connections',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 28, 49),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MentorPage()));
                  },
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Color.fromARGB(255, 231, 236, 251),
                margin: EdgeInsets.all(5.0),
                height: 155,
                width: 800,
                child: FutureBuilder<List<GetMyMentorsModel>?>(
                  future: futureMyMentors,
                  builder: (context, i) {
                    if (i.hasData) {
                      return GridView.builder(
                          padding: const EdgeInsets.all(0.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1),
                          scrollDirection: Axis.horizontal,
                          itemCount: i.data?.length,
                          itemBuilder: (context, index) {
                            GetMyMentorsModel? item = i.data?[index];

                            return _userCard(
                                item?.myMentorsAvatar ?? "",
                                '${i.data?[index].myMentorsName}',
                                '${i.data?[index].myMentorsSurname}',
                                i.data![index].myMentorsRatingAverage,
                                i.data![index].myMentorsId);
                          });
                    } else if (i.hasError) {
                      return Text('${i.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator(strokeWidth: 0.0);
                  },
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'Top Mentors',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: Color.fromARGB(255, 231, 236, 251),
              margin: EdgeInsets.all(5.0),
              height: 155,
              child: FutureBuilder<List<GetByRoleModel>?>(
                future: futureGetTop,
                builder: (context, i) {
                  if (i.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        scrollDirection: Axis.horizontal,
                        itemCount: i.data?.length,
                        itemBuilder: (context, index) {
                          return _userCard(
                              '${i.data?[index].avatar}',
                              '${i.data?[index].name}',
                              '${i.data?[index].surname}',
                              i.data![index].ratingAverage,
                              i.data![index].id);
                        });
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator(strokeWidth: 0.0);
                },
              ),
            ),
          ),

          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 180, 0),
                child: Text(
                  'Tags',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              ),
            ],
          ),
          // Container(
          //   height: 150,
          //   child: GridView.builder(
          //     itemCount: 5,
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          //     itemBuilder: (context, index) {
          //       return MySquare(child: Text("1"));
          //     },
          //   ),
          // ),
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: FutureBuilder<List<GetAllTagsModel>?>(
                future: futureGetTags,
                builder: (context, i) {
                  if (i.hasData) {
                    if (i.data != null && i.data!.isNotEmpty) {
                      return Wrap(
                          children: List.generate(
                        i.data!.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedChip = i.data?[index].id;
                              selectedChipName = i.data?[index].tagName;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TagMentorPage(
                                        tagId: selectedChip!,
                                        tagName: selectedChipName!,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: _buildChip('${i.data?[index].tagName}',
                                Color.fromARGB(255, 172, 138, 177)),
                          ),
                        ),
                      ));
                    }
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator(strokeWidth: 0.0);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

_null() {
  return null;
}
