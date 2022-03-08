import 'package:flutter/material.dart';
import 'package:search_deligate_toturial/models/students.dart';
import 'package:search_page/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Students> studentList;

  @override
  void initState() {
    super.initState();
    studentList = allStudents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Delegate",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchPage<Students>(
                    searchLabel: "Search Delegate",
                      builder: (studentList) {
                      return ListTile(
                        title: Text(studentList.name),
                        subtitle: Text(studentList.year),
                      );
                      },
                      filter: (studentList)=>[
                      studentList.name,
                        studentList.year,
                      ],
                      items: studentList,),);
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final Students students = studentList[index];
          return Card(
            child: ListTile(
              title: Text(students.name),
              subtitle: Text(students.year),
            ),
          );
        },
      ),
    );
  }
}
