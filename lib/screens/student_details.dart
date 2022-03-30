import 'dart:io';

import 'package:flutter/material.dart';

import '../functions/db_functions.dart';
import '../model/db_model.dart';

class studentDetails extends StatelessWidget {

  final int index;
  

   studentDetails({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        
        backgroundColor: Colors.blue,
      ),
      body: SafeArea
      (child: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child){
              final data = studentList[index];
              final image = data.image;
              return Container(
                
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        height:625,width: 370,
                        decoration: BoxDecoration(
                          borderRadius: 
                          BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              
                              child: ClipRRect(
                                
                                borderRadius: BorderRadius.circular(200),
                                child:
                                Image(image: FileImage(File(image)),fit: BoxFit.cover,width: 200,)

                              ),
                            
                            ),
                            SizedBox(height:20),
                            Container(width: double.infinity,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.blue,width: 2),
                            ),
                              child: Column(
                                children: [
                                Text('Name : ${data.name}',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35),),
                                
                                ],
                              ),
                            ),
                             SizedBox(height:5),
                            Container(width: double.infinity,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.blue,width: 2),
                            ),
                              child: Column(
                                children: [
                                Text('Age : ${data.age}',style: TextStyle(fontSize: 35),),
                                
                                ],
                              ),
                            ),
                             SizedBox(height:5),
                            Container(width: double.infinity,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.blue,width: 2),
                            ),
                              child: Column(
                                children: [
                                Text('Class : ${data.Class}',style: TextStyle(fontSize: 35),),
                                
                                ],
                              ),
                            ),
                             SizedBox(height:5),
                            Container(width: double.infinity,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.blue,width: 2),
                            ),
                              child: Column(
                                children: [
                                Text('Contact : ${data.phone}',style: TextStyle(fontSize: 35),),
                                
                                ],
                              ),
                            )
                            
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              );
            }
            ),
      )
    );
  }
}