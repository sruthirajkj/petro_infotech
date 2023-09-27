import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class audio_page extends StatefulWidget {
  const audio_page({Key? key}) : super(key: key);

  @override
  State<audio_page> createState() => _audio_pageState();
}

class _audio_pageState extends State<audio_page> {
  fetchAuditList() async {
    final url =
        "https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompanyCode=1&loggedInUserID=610";
    var response = await get(Uri.parse(url));
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    var authToken = await sharedPrefs.getString('auth_token');
    setState(() {});
    print("AuthToken: $authToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audit")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text("Bar Graph", style: TextStyle(fontSize: 20)),
        ),
        Center(
            child: Container(
          height: 450,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://previews.123rf.com/images/carpathianprince/carpathianprince1203/carpathianprince120300008/12987595-3d-business-growth-bar-graph-illustration.jpg"))),
        ))
      ]),
    );
  }
}
