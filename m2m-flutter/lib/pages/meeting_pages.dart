import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/model/getMeeting_model.dart';
import 'package:m2m_flutter_main/pages/add_task_bar_page.dart';
import 'package:m2m_flutter_main/pages/widgets/button.dart';
import 'package:m2m_flutter_main/themes.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../service/api_service.dart';
import '../service/shared_service.dart';

class MeetPages extends StatefulWidget {
  const MeetPages({Key? key}) : super(key: key);

  @override
  MeetPagesState createState() => MeetPagesState();
}

class MeetPagesState extends State<MeetPages> {
  Future<List<GetMeetingModel>> futureGetMeetingModel = APIService.getMeeting();
  DateTime _selectedDate = DateTime.now();
  List<String> tasks = [
    'post 1',
    'post 2 ',
    'post 3',
    'post 4',
  ];
  String text = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerHelp(),
      //bottomNavigationBar: BottomBar(),

      appBar: AppBar(
        title: Text(
          "EVENT PAGE",
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
          Container(
            margin: EdgeInsets.only(
              top: 30,
              right: 16,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBAr(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('Events', style: subHeadingStyle),
                  Container(
                    child: FutureBuilder<List<GetMeetingModel>>(
                        future: futureGetMeetingModel,
                        builder: (context, i) {
                          if (i.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: i.data?.length,
                              itemBuilder: (context, index) {
                                //var containers=  tasks.map((tasks)=> Container(
                                // height: 90,
                                // width: 50,
                                // margin: EdgeInsets.all(5),
                                //   color: MyThemes.primaryColor,child: Text(tasks))).toList()
                                //   child: Padding( padding:EdgeInsets.all(8),
                                return Card(
                                  child: ListTile(
                                    title: Text("Mentee:" +
                                        '${i.data![index].menteesName}' +
                                        "- " +
                                        '${i.data![index].menteesSurname}' +
                                        "Mentor:" +
                                        '${i.data![index].mentorName}' +
                                        " " +
                                        '${i.data![index].mentorSurname}'),
                                    subtitle: Text(
                                        '${i.data![index].startTime}' +
                                            " " +
                                            '${i.data![0].endTime}'),
                                    trailing: Container(
                                      width: 70,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          SimpleDialog(
                                                        children: [
                                                          TextField(onChanged:
                                                              (value) {
                                                            setState(() {
                                                              text = value;
                                                            });
                                                          }),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: Icon(Icons.edit))),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      tasks.removeAt(index);
                                                    });
                                                  },
                                                  icon: Icon(Icons.delete)))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                // return  containers[index];
                              },
                            );
                          } else if (i.hasError) {
                            return Text('${i.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _addDateBAr() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary,
            ])),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Color.fromARGB(255, 126, 122, 169),
          selectedTextColor: Color.fromARGB(255, 0, 0, 0),
          dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 33, 32, 32)),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 63, 62, 62)),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 34, 34, 34)),
          ),
          onDateChange: (date) {
            _selectedDate = date;
          },
        ),
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: HeadingStyle,
                )
              ],
            ),
          ),
          Container(
            child: MyButton(
              label: "+ Add Task",
              onTap: () => SharedService.loginDetails().then((value) =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddTaskPage(nereyeId: value)))),
            ),
          ),
        ],
      ),
    );
  }

  _removeTask(index) {}
}
