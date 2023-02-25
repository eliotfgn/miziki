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
          title: const Text(
            "Découvrir",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "http://10.0.2.2:8081/download/profile-pic-eliot-1.jpeg"),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        image: const DecorationImage(
                            image: NetworkImage(
                                "http://10.0.2.2:8081/download/playlist-moody.png"),
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                                Colors.black45, BlendMode.darken)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Moody",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Playlists en vogue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 65,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 65,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue.shade900,
                                Colors.purple.shade900,
                                Colors.pink.shade900,
                              ]),
                        ),
                        child: Row(children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                "http://10.0.2.2:8081/download/profile-pic-eliot.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Love is war",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("15 titres",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          )
                        ]),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 70,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.pink.shade900,
                                Colors.red.shade900,
                                Colors.yellow.shade900,
                              ]),
                        ),
                        child: Row(children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                "http://10.0.2.2:8081/download/playlist-the-vie-radio.jpeg"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "The vie radio",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("21 titres",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          )
                        ]),
                      )
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
