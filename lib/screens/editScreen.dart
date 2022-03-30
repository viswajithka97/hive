import 'package:flutter/material.dart';
import 'package:student/functions/db_functions.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/formfield.dart';

class EditScreen extends StatefulWidget {

  final int index;
  EditScreen({ Key? key,required this.index }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _namecontrol = TextEditingController();

    final _agecontrol = TextEditingController();

    final _phonecontrol = TextEditingController();

    final _classcontrol = TextEditingController();

    var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return Center(
            child: Container(
              

             height: 450,
        margin: const EdgeInsets.only(bottom: 350),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(115, 26, 19, 47),
                  blurRadius: 20,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 5.0))
            ],
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 255, 255, 255),
        ),
        width: 380,
        child: Padding(padding: EdgeInsets.only(left:20, right: 20)
        ,child: Form(
            child: Column(
            children: [
              SizedBox(height: 20,),
              Field(Control: _namecontrol, TextHint: 'Name'),
              SizedBox(height: 10),
              Field(Control: _agecontrol, TextHint: 'Age'),
              SizedBox(height: 10,),
    
             Field(Control: _phonecontrol, TextHint: 'Phone'),
              SizedBox(height: 10,),
    
              Field(Control: _classcontrol, TextHint: 'Class'),
              SizedBox(height: 10,),


              ElevatedButton.icon(onPressed: () async{
                var image= await imageSelect();
                 setState(() {
             _image=image;
         });

              }, icon: Icon(Icons.image), label: Text('Select Image')),
    
              ElevatedButton.icon(onPressed: (){
                updatButton(context);
    
              }, icon: Icon(Icons.save), label: Text('Update'))
            ],
        ),
        ),),
        
            ),
          );
            }
    ),
    ),
    );
  }

 Future <void> updatButton(BuildContext context) async{
    
final _name = _namecontrol.text;
final _age = _agecontrol.text;
final _phone = _phonecontrol.text;
final _Class = _classcontrol.text;


if(_name.isEmpty || _age.isEmpty || _phone.isEmpty || _Class.isEmpty || _image.isEmpty){
  return;
}
final _student = StudentModel(name: _name, age: _age, Class: _Class, phone: _phone,image: _image);

updateList( _student, widget.index);
  
}
}



  
