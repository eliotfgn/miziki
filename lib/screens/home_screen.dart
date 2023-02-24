import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Découvrir", style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("http://10.0.2.2:8081/download/profile-pic-eliot-1.jpeg"),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20),
            child: Column(
              children: [

              ],
            ),
          )
        ),
      ),
    );
  }
}
