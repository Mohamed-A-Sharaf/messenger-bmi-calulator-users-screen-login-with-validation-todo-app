import 'package:app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:app/modules/done_tasks/done_tasks_screen.dart';
import 'package:app/modules/new_tasks/new_tasks_screen.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/constants.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      // ignore: prefer_is_empty
      body: tasks.length == 0 ? const Center(child: CircularProgressIndicator()) : screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if(formKey.currentState!.validate()){
              insertToDatabase(title: titleController.text,
                  time: timeController.text ,
                  date: dateController.text,
              ).then((value)
              {
                getDataFromDatabase(database).then((value)
                {
                  Navigator.pop(context);
                  setState(() {
                    isBottomSheetShown = false;
                    fabIcon = Icons.edit;
                    tasks = value;
                });
              });

              });
            }

          } else {
            scaffoldKey.currentState?.showBottomSheet(
                  (context) =>
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0,),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          defaultFormField(
                            label: 'Task Title',
                            type: TextInputType.text,
                            prefix: Icons.title,
                            validate: (String value){
                              if(value.isEmpty){
                                return 'Title is Empty';
                              }
                              return null;
                            },
                            controller: titleController,
                          ),
                          const SizedBox(height: 10.0,),
                          defaultFormField(
                            label: 'Task Time',
                            type: TextInputType.datetime,
                            prefix: Icons.watch_later_outlined,
                            onTap: ()
                            {
                            showTimePicker(context: context,
                                initialTime:TimeOfDay.now(),
                            ).then((value)
                            {
                              timeController.text = value!.format(context).toString();
                            });
                            },
                            validate: (String value){
                              if(value.isEmpty){
                                return 'Time is Empty';
                              }
                              return null;
                            },
                            controller: timeController,
                          ),
                          const SizedBox(height: 10.0,),
                          defaultFormField(
                            label: 'Task Date',
                            type: TextInputType.datetime,
                            prefix: Icons.calendar_today,
                            onTap: ()
                            {
                                showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-01-01'),
                                ).then((value)
                                {
                                  dateController.text = DateFormat.yMMMd().format(value!);
                                });
                            },
                            validate: (String value){
                              if(value.isEmpty){
                                return 'Date is Empty';
                              }
                              return null;
                            },
                            controller: dateController,
                          ),
                        ],

                      ),
                    ),
                  ),
                  elevation: 20.0,
            ).closed.then((value)
            {
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }


          // insertToDatabase();

          // try{
          //   var name =await getName();
          //   if (kDebugMode) {
          //     print(name);
          //   }
          //   //throw('ya 7omar');
          // }catch(error)
          // {
          //   if (kDebugMode) {
          //     print('This is Error ${error.toString()}');
          //   }
          // }
          // getName().then((value) {
          //   print(value);
          //   throw('ya donkey');
          // }).catchError((error){
          //   print('Da Error ${error.toString()}');
          // });
        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Archive',
          ),
        ],
      ),
    );
  }

  // Future<String> getName() async {
  //   return 'Mohamed Ahmed';
  // }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        if (kDebugMode) {
          print('database created');
        }
        await database
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT ,date TEXT , time TEXT ,status TEXT)')
            .then((value) {
          if (kDebugMode) {
            print('Table Created');
          }
        }).catchError((error) {
          if (kDebugMode) {
            print('Error When Creating Table ${error.toString()}');
          }
        });
      },
      onOpen: (database) {

        if (kDebugMode) {
          print('database opened');
        }
      },
    );
  }

  Future insertToDatabase({
      required String title,
      required String time,
      required String date,
      }) async {
    return await database.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","New")',
      )
          .then((value) {
        if (kDebugMode) {
          print('$value inserted successfully');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Error When Inserting New Record ${error.toString()}');
        }
      });
    });
  }
  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
