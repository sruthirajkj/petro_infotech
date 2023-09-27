import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:petro_infotech/profile_page.dart';
import 'package:petro_infotech/home.dart';
import 'package:petro_infotech/profile.dart';

import 'audit_page.dart';
import 'home_page.dart';
import 'loginpage.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List pages=[home(),
    // AuditPage(),
    profile(), profile()];

  int select=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.file_copy_sharp), label: "Audit"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],currentIndex: select,
        onTap: (v){
          setState(() {
            select=v;
          });
        },),

      body:pages[select],
    );
  }
}
