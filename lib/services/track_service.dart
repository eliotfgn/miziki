import 'package:dio/dio.dart';

import '../constants/utils.dart';
import '../models/track.dart';

class TrackService {
  static Future<Track?> getTrack(int id) async {
    Track? track;
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}tracks/$id",
      );
      track = Track.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }

    return track;
  }

  static Future<List<Track>> getTracks() async {
    List<Track> tracks = [];
    Response response;

    try {
      response = await Dio().get(
        "${apiMizikiBaseUrl}tracks/",
      );
      response.data.forEach((track) {
        tracks.add(Track.fromJson(track));
      });
    } on DioError catch (e) {
      print(e);
    }

    return tracks;
  }
}
