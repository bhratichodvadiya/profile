import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile_flutter/api.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  bool _isloading = true;
  Temperatures? dataFromAPI;
  _getdata() async {
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      dataFromAPI = Temperatures.fromJson(data);
      _isloading = false;
      setState(() {});
    } else {
      return dataFromAPI;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
               padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                child: Card( 
                   elevation: 3,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  dataFromAPI!.products[index].thumbnail),
                            ),
                            subtitle: Text(dataFromAPI!.products[index].title),
                            title: Text(dataFromAPI!.products[index].brand),
                          ),
                        ],
                      )),
                );
              },
              itemCount: dataFromAPI!.products.length,
            ),
    );
  }
}
