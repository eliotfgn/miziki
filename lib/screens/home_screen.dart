import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_streaming_app/constants/utils.dart';
import 'package:music_streaming_app/screens/music_screen.dart';
import 'package:music_streaming_app/screens/playlist_details_screen.dart';
import 'package:music_streaming_app/services/playlist_service.dart';
import 'package:music_streaming_app/services/track_service.dart';
import 'package:music_streaming_app/widgets/bottom_navigation.dart';

import '../models/playlist.dart';
import '../models/track.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  List<Track> trendingTracks = [];
  List<Playlist> trendingPlaylists = [];
  List<Playlist> playlists = [];

  void initTracks() async {
    trendingTracks = await TrackService.getTracks();
    trendingTracks.shuffle();
    trendingTracks = trendingTracks.sublist(0, 10);
    setState(() {});
  }

  void initPlaylists() async {
    playlists = await PlaylistService.getPlaylists();
    playlists.sort(
      (a, b) => a.tracks.length.compareTo(b.tracks.length),
    );
    trendingPlaylists = playlists.sublist(0, 2);
    playlists.shuffle();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTracks();
    initPlaylists();
    if (trendingTracks.isEmpty) {
      setState(() {
        loading = false;
      });
    }
  }

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
          child: loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SpinKitDancingSquare(
                      color: Color(0xfffD65A14),
                      size: 100,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 170,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: playlists
                              .map(
                                (playlist) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlaylistDetailsScreen(
                                                    playlist.id)));
                                  },
                                  child: Container(
                                    height: 170,
                                    width: 170,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${apiFileServerBaseUrl}download/${playlist.cover}"),
                                          fit: BoxFit.fitWidth,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black45,
                                              BlendMode.darken)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          playlist.name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                    const SizedBox(
                      height: 40,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlaylistDetailsScreen(
                                                trendingPlaylists[0].id)));
                              },
                              child: Container(
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
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "${apiFileServerBaseUrl}download/${trendingPlaylists[0].cover}"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        trendingPlaylists[0].name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${playlists[0].tracks.length} titres",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12))
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlaylistDetailsScreen(
                                                trendingPlaylists[1].id)));
                              },
                              child: Container(
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
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "${apiFileServerBaseUrl}download/${trendingPlaylists[1].cover}"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        trendingPlaylists[1].name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${playlists[1].tracks.length} titres",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12))
                                    ],
                                  )
                                ]),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("Chansons du jour",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 250,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: trendingTracks
                                .map((track) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MusicScreen(track.id)));
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 170,
                                              width: 170,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xfffd65a14),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${apiFileServerBaseUrl}download/${track.cover}"))),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              track.title,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              track.artists[0].name,
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()))
                  ],
                ),
        )),
        bottomNavigationBar: const BottomNavigation(0),
      ),
    );
  }
}
