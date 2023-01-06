import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youtube_like_app/models/videos_model.dart';

class Videos extends ChangeNotifier {
  final _dio = Dio();
  VideosModel? videos;

  Future<void> fetchAndSetVideos() async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/youtube/v3/search',
        queryParameters: {
          'part': 'snippet',
          'key': 'AIzaSyBlLIEwyqTlfVot7C22t053RSdlgIGpvSs',
        },
      );

      if (response.statusCode == 200) {
        videos = VideosModel.fromJson(response.data);
        notifyListeners();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
