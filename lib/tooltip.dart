import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';


class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton.icon(
          onPressed: () {
            Checkpemission(Permission.photos, context);
          },
          icon: Icon(
            Icons.check,
            color: Colors.black,
            size: 30,
          ),
          label: Text(
            'True ',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          )),
    ));
  }

  Future<void> Checkpemission(Permission permission, context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('permission is Granted')));
    } else {
       ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('permission is not  Granted')));
    }
  }
}
