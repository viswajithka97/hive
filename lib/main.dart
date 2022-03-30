import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student/model/db_model.dart';
import 'package:student/screens/home/screen_home.dart';

Future <void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: ScreenHome(),
    );
  }
}