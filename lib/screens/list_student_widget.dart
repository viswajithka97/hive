


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/editScreen.dart';
import 'package:student/screens/student_details.dart';

class ListStudentWidget extends StatelessWidget {

  final image;

  ListStudentWidget({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search(),
      ),
      body: SafeArea(
        
          child: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];
                var imag = data.image;
                
                return ListTile(
                  
                  leading:
                  CircleAvatar(backgroundImage: 
                  FileImage(File(imag))
                  ),
                  title: Text(data.name),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
                    
                     studentDetails(index: index,)
                      ),);
                  },
                  subtitle: Text(data.age),
                  trailing:
                           Wrap(
                             children: [
                               IconButton(onPressed: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx1)=>EditScreen(index: index)));
                               }, icon: Icon(Icons.edit)),
                               IconButton(
                                onPressed: () {
                                      deleteStudent(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                            ),
                                               ),
                                             ],
                           ),
                        
                 
                  );
              },
              separatorBuilder: (ctx, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: studentList.length);
              
        },
      
      ),
      ),
    );

  }

  Widget search() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20)
        ),
        onChanged: (value){
          studentListNotifier.value = studentListNotifier.value
          .where((element) => element.name.contains(value)).toList();



















          
          studentListNotifier.notifyListeners();

          if(value == ''){
            getAllStudents();
          }else if(studentListNotifier.value.isEmpty){
            getAllStudents();

          }
        },
      ),
    );
    }

 

 
}
 
