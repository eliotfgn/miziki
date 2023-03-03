import 'package:flutter/material.dart';

import '../models/playlist.dart';
import '../services/playlist_service.dart';

class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  List<Playlist> playlists = [];

  initPlaylists() async {
    playlists = await PlaylistService.getPlaylists();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Playlists",
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
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const SizedBox(
          height: 20,
        ),
        Form(
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
                weight: 0.1,
              ),
              hintText: 'Rechercher une chanson',
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              fillColor: Colors.grey.shade900,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Récents",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            letterSpacing: 0.8,
                          ),
                        ),
                        Spacer(),
                        Text("123 sons",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              letterSpacing: 0.8,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade900,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      weight: 0.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Playlist artistes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red.shade900,
                  ),
                  Text('Artist',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Toutes vos playlists",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        GridView.count(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 20,
          physics: const NeverScrollableScrollPhysics(),
          children:
              playlists.map((playlist) => PlaylistWidget(playlist)).toList(),
        ),
      ]),
    );
  }
}

class PlaylistWidget extends StatelessWidget {
  Playlist playlist;

  PlaylistWidget(this.playlist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade900,
                image: DecorationImage(
                  image: NetworkImage(
                      "http://10.0.2.2:8081/download/${playlist.cover}"),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                playlist.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: 0.8,
                ),
              ),
              const Spacer(),
              Text("${playlist.tracks.length} sons",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    letterSpacing: 0.8,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
