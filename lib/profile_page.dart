import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
          child: Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"))),
            ),
          ),
        ),
        Text(
          "SRUTHIRAJ K J",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontStyle: FontStyle.italic),
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontStyle: FontStyle.normal),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0,bottom: 8),
          child: Container(
            height: 80,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Email",
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("sruthijyothiraj@gmail.com",
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.lightBlueAccent),
          ),
        ),
        Container(
          height: 80,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text("Github",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text("http://github.com/sruthirajkj",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.lightBlueAccent),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 80,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Mobile",
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text("9562434887",
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.lightBlueAccent),
          ),
        )
      ]),
    );
  }
}
