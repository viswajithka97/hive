import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/formfield.dart';
import 'package:student/screens/list_student_widget.dart';



class AddStudentWidget extends StatefulWidget {

AddStudentWidget({ Key? key }) : super(key: key);

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {

final _nameController =  TextEditingController();

final _ageController = TextEditingController();

final _phoneController = TextEditingController();

final _classcontroller = TextEditingController();

var _image;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
      children: [  
        Container(
          width: 100,height: 100,
          decoration: _image==null?BoxDecoration(image: DecorationImage(image: AssetImage('asset/images/default.jpg'))):BoxDecoration(image: DecorationImage(image: FileImage(File(_image)),fit: BoxFit.cover)),
          
        ),
        
        SizedBox(height: 20),
        Field(Control: _nameController, TextHint: 'Name'),

        SizedBox(height:20),

        Field(Control: _ageController, TextHint: 'Age'),

        SizedBox(height: 20,),

        Field(Control: _phoneController, TextHint: 'Phone Number'),
        
        SizedBox(height: 20,),

        Field(Control: _classcontroller, TextHint: 'Class'),
    
        ElevatedButton(onPressed: ()async{
         var image = await imageSelect();
         setState(() {
           _image=image;
         });
         
        }, child: Text('Select Imag')),
    
        ElevatedButton(onPressed: (){
          addStudentButton(context);
        }, child: Text('Add Student')),
    
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx1)=>ListStudentWidget()));
        }, child: Text('View List')),
        ElevatedButton(onPressed: (){
          deleteall();
        }, child: Text('Delete all Data'))
     
    
    
      ],
      ),
    
    );
  }

  Future<void> addStudentButton(BuildContext ctx) async{
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phoneController.text;
    final _class = _classcontroller.text;

    if(_name.isEmpty || _age.isEmpty|| _class.isEmpty || _phone.isEmpty || _image.isEmpty){

      return;

    }
    else
    {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Added Student'),
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,));
    }
      final _student = StudentModel(name: _name, age: _age,Class: _class,phone: _phone,image: _image);

      addStudent(_student);

      _image=null;
    }
}
