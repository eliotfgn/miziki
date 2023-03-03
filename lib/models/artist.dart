class Artist {
  final int id;
  final String name;
  final String bio;
  final String profilePic;
  final int followersCount;

  Artist(this.id, this.name, this.bio, this.profilePic, this.followersCount);

  factory Artist.fromJson(Map<String, dynamic> json) =>
      Artist(
        json['id'],
        json['name'],
        json['bio'],
        json['profilePic'],
        json['followersCount'],
      );
}
