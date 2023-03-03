import 'package:dio/dio.dart';
import 'package:music_streaming_app/constants/utils.dart';
import 'package:music_streaming_app/models/playlist.dart';

class PlaylistService {
  static Future<List<Playlist>> getPlaylists() async {
    List<Playlist> playlists = [];
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}playlists",
      );
      response.data.forEach((playlist) {
        playlists.add(Playlist.fromJson(playlist));
      });
    } on DioError catch (e) {
      print(e);
    }

    return playlists;
  }

  static Future<Playlist?> getPlaylist(int id) async {
    Playlist? playlist;
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}playlists/$id",
      );
      playlist = Playlist.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }

    return playlist;
  }
}
