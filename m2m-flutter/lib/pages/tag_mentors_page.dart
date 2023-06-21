import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/getUserByTag_model.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/stars.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'package:http/http.dart';
import '../common/Listing.dart';
import '../model/getByRole_model.dart';
import '../pages/profile_page.dart';

class TagMentorPage extends StatefulWidget {
  final int tagId;
  final String tagName;
  const TagMentorPage({Key? key, required this.tagId, required this.tagName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TagMentorPageState();
  }
}

class _TagMentorPageState extends State<TagMentorPage> {
  TextEditingController editingController = TextEditingController();

  late Future<List<GetUserByTagModel>?> futureGetByTag;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureGetByTag = APIService.getUserByTag(widget.tagId);
    print(futureGetByTag);
  }

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  void filterSearchResults(String query) {
//search kısmı dolacak
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHelp(),
      //bottomNavigationBar: BottomBar(),
      body: FutureBuilder<List<GetUserByTagModel>?>(
        future: futureGetByTag,
        builder: (context, i) {
          if (i.hasData) {
            return ListView.builder(
                itemCount: i.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                  nereyeId: i.data?[index].userId)));
                    },
                    title: Row(
                      children: [
                        Text('${i.data?[index].userTagName}' +
                            '   ' +
                            '${i.data?[index].userTagSurname}'),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: <Widget>[
                        //     Stars(average: i.data?[index].userTagRatingAverage),
                        //   ],
                        // ),
                      ],
                    ),
                    subtitle: Text('${i.data?[index].userTagCity}'),
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 197, 194, 194),
                      child: Text('${i.data?[index].userTagName[0]}'),
                    ),
                    trailing: Column(
                      children: <Widget>[],
                    ),
                  );
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
          widget.tagName,
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
      ),
    );
  }
}
