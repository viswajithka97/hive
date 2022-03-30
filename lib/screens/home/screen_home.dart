import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/screens/add_student_widget.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          AddStudentWidget(),
        ],
      )),
      
    );
  }
}