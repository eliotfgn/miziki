import 'package:music_streaming_app/models/track.dart';

class Playlist {
  final int id;
  final String name;
  final String description;
  final String cover;
  final int likesCount;
  final bool isPrivate;
  final int userId;
  List<Track> tracks = [];

  Playlist(this.id, this.name, this.description, this.cover, this.likesCount,
      this.isPrivate, this.userId, this.tracks);

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        json['id'],
        json['name'],
        json['description'],
        json['cover'],
        json['likesCount'],
        json['isPrivate'],
        json['userId'],
        json['tracks'].map<Track>((track) => Track.fromJson(track)).toList(),
      );
}
