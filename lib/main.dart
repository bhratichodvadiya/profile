
import 'package:flutter/material.dart';
import 'package:profile_flutter/homescreen.dart';
import 'package:profile_flutter/localauth.dart';
import 'package:profile_flutter/localnotification.dart';
import 'package:profile_flutter/notification.dart';
import 'package:profile_flutter/search.dart';
import 'package:profile_flutter/tooltip.dart';


void main()async{
    WidgetsFlutterBinding.ensureInitialized();
 await LocalNotifications.init();  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Homescreen(),
    );
  }
}

