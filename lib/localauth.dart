import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:local_auth/local_auth.dart';
import 'package:profile_flutter/homescreen.dart';

class localauth extends StatefulWidget {
  const localauth({super.key});

  @override
  State<localauth> createState() => _localauthState();
}

final LocalAuthentication auth = LocalAuthentication();
checkauth() async {
  bool isavailable;
  isavailable = await auth.canCheckBiometrics;
  print(isavailable);
  if (isavailable) {
    bool result = await auth.authenticate(
        localizedReason: 'Scan your fingerprint process');
    if (result) {
    } else {
      print('Not Allowd to data ');
    }
  } else {
    print("is not availble");
  }
}

class _localauthState extends State<localauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ),
        Center(
          child: Lottie.asset("assets/images/Animation - 1712137641532.json",
              height: 200.0, width: 200.0, fit: BoxFit.cover),
        ),
        Center(
          child: Text(
            'Fingerprint Auth',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ),
        Center(
          child: Text(
            'Authenticatie using printerprit to  \n      process in application',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: () {
            checkauth();
          },
          child: Text(
            'Authentication',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ));
  }
}
