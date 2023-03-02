import 'package:flutter/material.dart';

class PlaylistDetailsScreen extends StatefulWidget {
  const PlaylistDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistDetailsScreen> createState() => _PlaylistDetailsScreenState();
}

class _PlaylistDetailsScreenState extends State<PlaylistDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Playlist",
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
          padding: EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    image: const DecorationImage(
                      image: NetworkImage(
                          "http://10.0.2.2:8081/download/playlist-pic-mood.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Mood",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "123 sons",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // a row with music player controller
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                      size: 70,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
