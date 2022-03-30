

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student/model/db_model.dart';

var _image;

ValueNotifier<List <StudentModel>> studentListNotifier = ValueNotifier([]);


Future <void> addStudent(StudentModel value) async{

 final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.add(value);

  studentListNotifier.value.add(value);

  studentListNotifier.notifyListeners();
}

Future <void> getAllStudents() async{

  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);

  studentListNotifier.notifyListeners();


}

Future<void> deleteStudent(int id) async{

final studentDB = await Hive.openBox<StudentModel>('student_db');

final keys = studentDB.keys;

final key = keys.elementAt(id);

await studentDB.delete(key);

getAllStudents();

}
 Future<void> updateList(StudentModel value , index) async{


final studentDB = await Hive.openBox<StudentModel>('student_db');

final keys = studentDB.keys;

final key = keys.elementAt(index);

print(key);

await studentDB.put(key, value);

// studentListNotifier.value = value;

   studentListNotifier.notifyListeners();

   getAllStudents();

 }



Future<String>imageSelect() async{

  XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);



 return img!.path;


}


Future<void> deleteall() async{

  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentDB.clear();
  studentListNotifier.value.clear();
}

