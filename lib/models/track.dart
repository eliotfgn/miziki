class Track {
  final String id;
  final String title;
  final int duration;
  final String audio;
  final String cover;
  final List<String> tags;
  final int likesCount;

  Track(this.id, this.title, this.duration, this.audio, this.cover, this.tags,
      this.likesCount);

  factory Track.fromJson(Map<String, dynamic> json) =>
      Track(
        json['id'],
        json['title'],
        json['duration'],
        json['audio'],
        json['cover'],
        json['tags'].cast<String>(),
        json['likesCount'],
      );
}
