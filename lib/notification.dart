import 'package:flutter/material.dart';
import 'package:profile_flutter/localnotification.dart';

class database extends StatefulWidget {
  const database({super.key});

  @override
  State<database> createState() => _databaseState();
}

class _databaseState extends State<database> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Local Notification'),
        ),
        body: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  LocalNotifications.showsimplenotification(
                      title: 'Shownotification',
                      body: 'This is a Simaple Notification',
                      payload: 'Simple notification show');
                },
                icon: Icon(Icons.notifications_active),
                label: Text('notification')),
            ElevatedButton.icon(
                onPressed: () {
                  LocalNotifications.showperiodicNotification(
                      title: 'show period notification',
                      body: 'This is period Notification',
                      payload: 'period notification show');
                },
                icon: Icon(Icons.watch_later_sharp),
                label: Text('period notification')),
            ElevatedButton.icon(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  LocalNotifications.cancel(1);
                },
                label: Text('Cancel notification')),
            ElevatedButton(
                onPressed: () {
                  LocalNotifications.cancelAll();
                },
                child: Text('Close notification'))
          ],
        ));
  }
}
