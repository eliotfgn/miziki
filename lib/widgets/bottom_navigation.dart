import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_streaming_app/screens/home_screen.dart';
import 'package:music_streaming_app/screens/playlists_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation(this.currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            break;
          case 2:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaylistsScreen()));
            break;
        }
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey.shade900,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      enableFeedback: false,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_outlined),
          label: "Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          label: "Playlist",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.upload,
            size: 20,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
