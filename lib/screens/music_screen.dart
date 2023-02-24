import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87.withOpacity(0.5),
            Colors.white.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  "https://i.pinimg.com/236x/d1/e5/3f/d1e53f0adb299da844181b2309caab84.jpg",
                )),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Pop Smoke",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Imperfections",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            PlayerControl(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.expand_circle_down_sharp,
          color: Colors.white,
          size: 25,
        ),
        onPressed: null,
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
      margin: EdgeInsets.only(top: 30),
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
      margin: const EdgeInsets.all(20),
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
                    color: Colors.redAccent,
                    size: 35,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.grey,
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
        value: 15,
        min: 1.0,
        max: 100,
        divisions: 10,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onChanged: (double newValue) {},
      ),
    );
  }
}
