import 'package:music_streaming_app/models/artist.dart';

class Track {
  final int id;
  final String title;
  final int duration;
  final String audio;
  final String cover;
  final List<String> tags;
  final int likesCount;
  List<Artist> artists = [];

  Track(this.id, this.title, this.duration, this.audio, this.cover, this.tags,
      this.likesCount, this.artists);

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        json['id'],
        json['title'],
        json['duration'],
        json['audio'],
        json['cover'],
        json['tags'].cast<String>(),
        json['likesCount'],
        json['artists']
            .map<Artist>((artist) => Artist.fromJson(artist))
            .toList(),
      );
}
