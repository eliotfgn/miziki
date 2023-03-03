import 'package:dio/dio.dart';
import 'package:music_streaming_app/models/artist.dart';

import '../constants/utils.dart';

class ArtistService {
  static Future<List<Artist>> getAllArtists() async {
    List<Artist> artists = [];
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}artists/",
      );
      response.data.forEach((artist) {
        artists.add(Artist.fromJson(artist));
      });
    } on DioError catch (e) {
      print(e);
    }

    return artists;
  }

  static Future<Artist?> getArtist(int id) async {
    Artist? artist;
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}artists/$id",
      );
      artist = Artist.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }

    return artist;
  }
}
