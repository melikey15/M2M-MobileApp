import 'dart:convert';

import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/model/getMyMentees_model.dart';
import 'package:m2m_flutter_main/pages/add_task_bar_page.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
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

class ChooseMentee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenteePageState();
  }
}

class _MenteePageState extends State<ChooseMentee> {
  int? menteeId;
  late Future<List<GetMyMenteesModel>> FutureGetMyMenteesModel;

  @override
  @override
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  void filterSearchResults(String query) {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GetMyMenteesModel>>(
        future: FutureGetMyMenteesModel,
        builder: (context, i) {
          if (i.hasData) {
            return ListView.builder(
                itemCount: i.data?.length,
                itemBuilder: (context, index) {
                  return _users(
                      '${i.data?[index].myMenteesName}',
                      '${i.data?[index].myMenteesSurname}',
                      '${i.data?[index].myMenteesEmail}',
                      '${i.data?[index].myMenteesUserRole}',
                      i.data![index].id,
                      context);
                });
          } else if (i.hasError) {
            return Text('${i.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Choose Mentee!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // elevation: 0.5,
        // iconTheme: IconThemeData(color: Colors.white),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //           colors: <Color>[
        //         //Theme.of(context).primaryColor,
        //         //Theme.of(context).colorScheme.secondary,
        //       ])),
        // ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(context: context, delegate: MySearchDelegate());
        //     },
        //   ),
        // ],
      ),
      drawer: DrawerHelp(),
      //bottomNavigationBar: BottomBar(),
    );
    // );
  }
}

Widget _users(String name, String surname, String userRole, String email,
    int id, BuildContext context) {
  return ListTile(
    onTap: () async {
      Navigator.pop(context, id);
    },
    title: Text(name + '   ' + surname + ' \n ' + userRole),
    subtitle: Text(email),
  );
}

// class MySearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
//}
