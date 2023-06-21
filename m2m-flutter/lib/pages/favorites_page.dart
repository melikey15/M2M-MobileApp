import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/model/message_model.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/widgets/stars.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/service/api_service.dart';

import '../model/getMyFavorites_model.dart';
import '../service/shared_service.dart';
import 'login_page.dart';
import 'package:http/http.dart';
import '../common/Listing.dart';
import '../model/getByRole_model.dart';
import '../model/getById_model.dart';
import 'profile_page.dart';
import '../model/getByRole_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FavoritesPageState();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {
  TextEditingController editingController = TextEditingController();
  Future<List<GetMyFavoritesModel>?> futureMyFavorite =
      APIService.getMyFavorites();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  ///////////////////////////////////////////////////
  @override
  void filterSearchResults(String query) {
    ///////////////////////////////////////
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHelp(),
      body: FutureBuilder<List<GetMyFavoritesModel>?>(
        future: futureMyFavorite,
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
                              builder: (context) =>
                                  ProfilePage(nereyeId: i.data?[index].id)));
                    },
                    title: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
                      //color:
                      //  Color.fromARGB(255, 105, 48, 112).withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${i.data?[index].favMentorsName}' +
                              '   ' +
                              '${i.data?[index].favMentorsSurname}'),
                          // Expanded(
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.only(left: 0, top: 10),
                          //     child: Text(
                          //       '${i.data?[index].ratingAverage}',
                          //       style: TextStyle(
                          //           fontSize: 20,
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .secondary),
                          //     ),
                          //   ),
                          // ),
                          //Stars(average: i.data?[index].ratingAverage),
                        ],
                      ),
                    ),
                    subtitle: Text('${i.data?[index].favMentorsCity}'),
                    leading: CircleAvatar(
                      //backgroundColor: Color.fromARGB(255, 194, 189, 189),
                      child: Text('${i.data?[index].favMentorsName[0]}'),
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
          "Favorites Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
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
