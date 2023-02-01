import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_streaming_app/screens/music_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black87.withOpacity(0.5),
          ),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 177),
          width: 316,
          height: 358,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [Text("Playlist name")],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [Text("Playlist name")],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [Text("Playlist name")],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [Text("Playlist name")],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
