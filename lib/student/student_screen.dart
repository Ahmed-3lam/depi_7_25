import 'package:depi_7_25/student/db_helper.dart';
import 'package:depi_7_25/student/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  List<StudentModel> studentList = [];
  bool isLoading = false;

  void fetchStudentsData() async {
    isLoading = true;
    setState(() {});
    final tempList = await DbHelper.getAllStudents();
    studentList = tempList.map((e) => StudentModel.fromJson(e)).toList();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchStudentsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DbHelper.update(newName: "Mohamed", newAge: 60, oldName: "Alaa");
          fetchStudentsData();
        },
        child: Icon(Icons.add),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(studentList[index].name ?? ""),
                subtitle: Text(studentList[index].age!.toString()),
              ),
            ),
    );
  }
}
