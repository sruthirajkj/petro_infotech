// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'home_page.dart';
//
// class login_page extends StatefulWidget {
//   const login_page({Key? key}) : super(key: key);
//
//   @override
//   State<login_page> createState() => _login_pageState();
// }
//
// class _login_pageState extends State<login_page> {
//   TextEditingController usercontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//
//   // Future<dynamic> postdata(String username,String password) async {
//   //   final url =
//   //       "https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin";
//   //   var body = {
//   //     "username": username,
//   //     "password": password,
//   //     "authType": "FORMS",
//   //     "ipAddress": ""
//   //   };
//   //   var response = await post(Uri.parse(url), body: jsonEncode(body));
//   //   print(response.body);
//   //   if (response.statusCode == 200) {
//   //     print(response.body);
//   //   } else {
//   //     print("something wrong");
//   //     var resp = jsonDecode(response.body);
//   //   }
//   // }
//   Future<void> login() async {
//     final apiUrl = Uri.parse('https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin');
//     final response = await http.post(apiUrl, body: {
//       "username": usercontroller.text,
//       "password": passwordcontroller.text,
//       "authType": "FORMS",
//       "ipAddress": ""
//     });
//
//     if (response.statusCode == 200) {
//       // Successfully logged in, handle response data here
//       final responseData = json.decode(response.body);
//       print(responseData);
//       SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//       sharedPreferences.setString("token", responsedata[]);
//     } else {
//       // Handle error
//       print('Login failed');
//     }
//   }
//   sharedpreference()async{
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Center(
//             child: Padding(
//           padding: const EdgeInsets.only(top: 200, left: 15, right: 15),
//           child: Text(
//             "LOGIN",
//             style: TextStyle(color: Colors.blue, fontSize: 80),
//           ),
//         )),
//         Padding(
//           padding:
//               const EdgeInsets.only(right: 15.0, left: 15, bottom: 15, top: 20),
//           child: TextFormField(
//             controller: usercontroller,
//             decoration: InputDecoration(
//                 hintText: "username",
//                 label: Text("username"),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15)))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0, right: 15),
//           child: TextFormField(
//             controller: passwordcontroller,
//             decoration: InputDecoration(
//                 hintText: "password",
//                 label: Text("password"),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15)))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 30),
//           child: ElevatedButton(
//             onPressed: () {
//               login();
//               // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//               //   return home_page();
//               // }));
//             },
//             child: Text("Login"),
//           ),
//         )
//       ]),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'home_pageui.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var authToken;

  Future<void> login() async {
    final apiUrl = Uri.parse(
        'https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin');
    var data = {
      "userName": usercontroller.text,
      "password": passwordcontroller.text,
      "authType": "FORMS",
      "ipAddress": ""
    };

    final response = await http.post(apiUrl,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      // Successfully logged in, handle response data here
      final responseData = json.decode(response.body);
      print(responseData);
      final token = responseData[
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjYxMCIsImdyb3Vwc2lkIjoiMCIsIm5iZiI6MTY5NTc4OTcyMywiZXhwIjoxNjk1ODc2MTIzLCJpYXQiOjE2OTU3ODk3MjN9.X1tFT1ahRJRD--wAEmDvdZPlEcKmTfpPecj1U0xeVYc'];
      //print(token);
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('auth_token', token);

      //responseData[
      //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjYxMCIsImdyb3Vwc2lkIjoiMCIsIm5iZiI6MTY5NTc0NTMzNiwiZXhwIjoxNjk1ODMxNzM2LCJpYXQiOjE2OTU3NDUzMzZ9.KZjIov49lLSTiplwBHEUz8F7iSX0oYDPGRZPEZ1dOBQ']);
    } else {
      // Handle error
      print(response.body);
    }
  }

  // Future<bool> isTokenStored() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //    authToken = sharedPreferences.getString('auth_token');
  //   return authToken != null;
  // }
  @override
  void initState() {
    // TODO: implement initState
    // isTokenStored();
    super.initState();
  }

  var fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Column(children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 200, left: 15, right: 15),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.blue, fontSize: 80),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(
                right: 15.0, left: 15, bottom: 15, top: 20),
            child: TextFormField(
              controller: usercontroller,
              decoration: const InputDecoration(
                  hintText: "username",
                  label: Text("username"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: TextFormField(
              controller: passwordcontroller,
              decoration: const InputDecoration(
                  hintText: "password",
                  label: Text("password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                login();
                bool validate = fkey.currentState!.validate();
                if (validate == false) {
                  return;
                } else {
                  if (usercontroller.text == "afthab" &&
                      passwordcontroller.text == "12345678") {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return home_page();
                    }));
                  }
                }
              },
              child: const Text("Login"),
            ),
          )
        ]),
      ),
    );
  }
}
