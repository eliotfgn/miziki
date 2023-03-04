import 'package:flutter/material.dart';
import 'package:music_streaming_app/models/playlist.dart';
import 'package:music_streaming_app/models/track.dart';

import '../constants/utils.dart';
import '../services/playlist_service.dart';

class PlaylistDetailsScreen extends StatefulWidget {
  final int id;

  const PlaylistDetailsScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<PlaylistDetailsScreen> createState() => _PlaylistDetailsScreenState();
}

class _PlaylistDetailsScreenState extends State<PlaylistDetailsScreen> {
  Playlist? playlist;

  initPlaylist() async {
    playlist = await PlaylistService.getPlaylist(widget.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlaylist();
  }

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                image: DecorationImage(
                  image: NetworkImage(
                      "http://10.0.2.2:8081/download/${playlist?.cover}"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              playlist?.name ?? "-",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${playlist?.tracks.length} sons",
              style: const TextStyle(
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
            const SizedBox(
              height: 20,
            ),
            // a list of tracks
            Flexible(
              child: ListView.builder(
                itemCount: playlist?.tracks.length,
                itemBuilder: (context, index) {
                  print("printing: ${playlist?.tracks.length}");
                  return TrackItem(
                    index: index,
                    title: playlist?.tracks[index].title,
                    cover: playlist?.tracks[index].cover,
                    artistName: playlist?.tracks[index].artists[0].name,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackItem extends StatelessWidget {
  final int index;
  final Track? track;
  final String? cover;
  final String? title;
  final String? artistName;

  const TrackItem({
    Key? key,
    required this.index,
    this.track,
    this.cover,
    this.title,
    this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: 20,
            child: Text(
              "${(index + 1)}.".padLeft(3, "0"),
              style: const TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                    "${apiFileServerBaseUrl}download/$cover",
                  )))),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "-",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                artistName ?? "-",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
