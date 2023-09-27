// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class AuditPage extends StatefulWidget {
//   @override
//   _AuditPageState createState() => _AuditPageState();
// }
//
// class _AuditPageState extends State<AuditPage> {
//   List<AuditItem> auditList = [];
//   List<charts.Series<AuditData, String>> barChartData = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     // Fetch data for the bar graph
//     final barGraphResponse = await http.get(
//       Uri.parse(
//           'https://www.petroinfotech.com/PetroHSE/api/Audit/GetDashboardAuditList?UserCompanyCode=1&loggedInUserID=610'),
//       headers: {
//         'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with your access token
//         'CompanyCode': '1',
//         'UserId': 'YOUR_USER_ID', // Replace with your user ID
//         'appType': 'MOB',
//         'content-type': 'application/json',
//         'accept': 'application/json',
//       },
//     );
//
//     if (barGraphResponse.statusCode == 200) {
//       final List<dynamic> data = json.decode(barGraphResponse.body);
//       barChartData = [
//         charts.Series<AuditData, String>(
//           id: 'auditData',
//           data: data.map((item) {
//             return AuditData(
//               category: item['Category'],
//               count: item['Count'],
//             );
//           }).toList(),
//           domainFn: (AuditData audit, _) => audit.category,
//           measureFn: (AuditData audit, _) => audit.count,
//           colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//           labelAccessorFn: (AuditData audit, _) => '${audit.category}: ${audit.count}',
//         ),
//       ];
//     }
//
//     // Fetch data for the audit list
//     final auditListResponse = await http.get(
//       Uri.parse(
//           'https://www.petroinfotech.com/PetroHSE/api/Audit/GetAuditList?mode=ALL&status=ALL'),
//       headers: {
//         'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with your access token
//         'CompanyCode': '1',
//         'UserId': 'YOUR_USER_ID', // Replace with your user ID
//         'appType': 'MOB',
//         'content-type': 'application/json',
//         'accept': 'application/json',
//       },
//     );
//
//     if (auditListResponse.statusCode == 200) {
//       final List<dynamic> data = json.decode(auditListResponse.body);
//       auditList = data.map((item) {
//         return AuditItem(
//           title: item['Title'],
//           date: item['Date'],
//           status: item['Status'],
//         );
//       }).toList();
//     }
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audit Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Center(
//               child: charts.BarChart(
//                 barChartData,
//                 animate: true,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: ListView.builder(
//               itemCount: auditList.length,
//               itemBuilder: (context, index) {
//                 final auditItem = auditList[index];
//                 return ListTile(
//                   title: Text(auditItem.title),
//                   subtitle: Text('Date: ${auditItem.date}, Status: ${auditItem.status}'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AuditData {
//   final String category;
//   final int count;
//
//   AuditData({required this.category, required this.count});
// }
//
// class AuditItem {
//   final String title;
//   final String date;
//   final String status;
//
//   AuditItem({required this.title, required this.date, required this.status});
// }
