// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuditPage extends StatefulWidget {
//   @override
//   _AuditPageState createState() => _AuditPageState();
// }
//
// class _AuditPageState extends State<AuditPage> {
//   // List<AuditItem> auditList = [];
//   // List<charts.Series<AuditData, String>> barChartData = [];
//
//   @override
//   // void initState() {
//   //   super.initState();
//   //   fetchData();
//   // }
//
//   // Future<void> fetchData() async {
//   //   // Fetch data for the bar graph
//   //   final barGraphResponse = await http.get(
//   //     Uri.parse(
//   //         'https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompanyCode=1&loggedInUserID=610'),
//   //     headers: {
//   //       'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with your access token
//   //       'CompanyCode': '1',
//   //       'UserId': 'YOUR_USER_ID', // Replace with your user ID
//   //       'appType': 'MOB',
//   //       'content-type': 'application/json',
//   //       'accept': 'application/json',
//   //     },
//   //   );
//   //
//   //   if (barGraphResponse.statusCode == 200) {
//   //     final List<dynamic> data = json.decode(barGraphResponse.body);
//   //     barChartData = [
//   //       charts.Series<AuditData, String>(
//   //         id: 'auditData',
//   //         data: data.map((item) {
//   //           return AuditData(
//   //             category: item['Category'],
//   //             count: item['Count'],
//   //           );
//   //         }).toList(),
//   //         domainFn: (AuditData audit, _) => audit.category,
//   //         measureFn: (AuditData audit, _) => audit.count,
//   //         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//   //         labelAccessorFn: (AuditData audit, _) => '${audit.category}: ${audit.count}',
//   //       ),
//   //     ];
//   //   }
//   //
//   //   // Fetch data for the audit list
//   //   final auditListResponse = await http.get(
//   //     Uri.parse(
//   //         'https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL'),
//   //     headers: {
//   //       'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with your access token
//   //       'CompanyCode': '1',
//   //       'UserId': 'YOUR_USER_ID', // Replace with your user ID
//   //       'appType': 'MOB',
//   //       'content-type': 'application/json',
//   //       'accept': 'application/json',
//   //     },
//   //   );
//   //
//   //   if (auditListResponse.statusCode == 200) {
//   //     final List<dynamic> data = json.decode(auditListResponse.body);
//   //     auditList = data.map((item) {
//   //       return AuditItem(
//   //         title: item['Title'],
//   //         date: item['Date'],
//   //         status: item['Status'],
//   //       );
//   //     }).toList();
//   //   }
//   //
//   //   setState(() {});
//   // }
//   Future<List<dynamic>> fetchAuditList() async {
//     final String apiUrl = "https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL";
//
//     // Replace with your token and user ID logic
//     String token = "your_token_here";
//     int userId = 123;

//
//     final response = await http.get(
//       Uri.parse(apiUrl),
//       headers: {
//         "Authorization": "Bearer $token",
//         "CompanyCode": "1",
//         "UserId": userId.toString(),
//         "appType": "MOB",
//         "content-type": "application/json",
//         "accept": "application/json",
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load audit list');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audit Page'),
//       ),
//       body: FutureBuilder(
//         future: fetchAuditList(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<dynamic> auditList = snapshot.data as List<dynamic>;
//             return ListView.builder(
//               itemCount: auditList.length,
//               itemBuilder: (context, index) {
//                 // Customize how you display each audit item here
//                 return ListTile(
//                   title: Text('Audit ${auditList[index]['auditId']}'),
//                   subtitle: Text('Status: ${auditList[index]['status']}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//
//       // body: Column(
//       //   children: [
//       //     Expanded(
//       //       flex: 2,
//       //       child: Center(
//       //         child: charts.BarChart(
//       //           barChartData,
//       //           animate: true,
//       //         ),
//       //       ),
//       //     ),
//       //     Expanded(
//       //       flex: 3,
//       //       child: ListView.builder(
//       //         itemCount: auditList.length,
//       //         itemBuilder: (context, index) {
//       //           final auditItem = auditList[index];
//       //           return ListTile(
//       //             title: Text(auditItem.title),
//       //             subtitle: Text('Date: ${auditItem.date}, Status: ${auditItem.status}'),
//       //           );
//       //         },
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
// //
// // class AuditData {
// //   final String category;
// //   final int count;
// //
// //   AuditData({required this.category, required this.count});
// // }
// //
// // class AuditItem {
// //   final String title;
// //   final String date;
// //   final String status;
// //
// //   AuditItem({required this.title, required this.date, required this.status});
// // }
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
