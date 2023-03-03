class Playlist {
  final int id;
  final String name;
  final String description;
  final String cover;
  final int likesCount;
  final bool isPrivate;
  final int userId;

  Playlist(this.id, this.name, this.description, this.cover, this.likesCount,
      this.isPrivate, this.userId);

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      Playlist(
        json['id'],
        json['name'],
        json['description'],
        json['cover'],
        json['likesCount'],
        json['isPrivate'],
        json['userId'],
      );
}
