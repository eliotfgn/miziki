import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_streaming_app/constants/utils.dart';
import 'package:music_streaming_app/models/track.dart';
import 'package:music_streaming_app/services/track_service.dart';

class MusicScreen extends StatefulWidget {
  int trackId;

  MusicScreen(this.trackId, {Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  Track? track;
  bool playing = false;
  AudioPlayer player = AudioPlayer();
  late Stream<Duration> position;

  initTrack(id) async {
    track = await TrackService.getTrack(id);
    if (track != null) {
      initAudioPlayer();
      play();
      setState(() {});
    }
  }

  initAudioPlayer() async {
    final url = "${apiFileServerBaseUrl}download/${track?.audio}";
    Duration? duration = await player.setUrl(url);
    position = player.positionStream;
  }

  play() async {
    await player.play();
    setState(() {
      playing = true;
      print(playing);
    });
  }

  pause() async {
    await player.pause();
    setState(() {
      playing = false;
      print(playing);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTrack(widget.trackId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage("${apiFileServerBaseUrl}download/${track?.cover}"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${apiFileServerBaseUrl}download/${track?.cover}"))),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${track?.artists[0].name}",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${track?.title}",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //PlayerControl(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                  value: 0,
                  onChanged: (newValue) {},
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (playing) {
                        pause();
                      } else {
                        play();
                      }
                    },
                    icon: Icon(
                      playing
                          ? Icons.pause_circle_filled_rounded
                          : Icons.play_circle_fill_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.expand_circle_down_sharp,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black87,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: 'Bibliothèque',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music_rounded),
          label: 'Playlists',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Rechercher',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_rounded),
          label: 'Bibliothèque',
        ),
      ],
    );
  }
}

class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: MusicControlButtonSection(),
          )
        ],
      ),
    );
  }
}

class MusicControlButtonSection extends StatelessWidget {
  const MusicControlButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconButton(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          MusicSliderSection(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const IconButton(
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: null,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.pause,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
              ),
              const IconButton(
                icon: Icon(
                  Icons.skip_next,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: null,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.black87.withOpacity(0.7),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.library_add_rounded),
                  color: Colors.white,
                ),
                const Text(
                  "Add to playlist",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MusicSliderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Slider(
        value: 0,
        min: 0,
        max: 100,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onChanged: (double newValue) {},
      ),
    );
  }
}
