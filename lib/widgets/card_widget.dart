import 'package:flutter/material.dart';
import 'package:youtube_like_app/models/videos_model.dart';
import 'package:youtube_like_app/utils/posted_at.dart';

//stateful widget card class
class CardWidget extends StatelessWidget {
  const CardWidget({required this.video, Key? key}) : super(key: key);

  final Item video;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: Image.network(
              video.snippet.thumbnails.high.url,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle, size: 45),
            title: Text(
              video.snippet.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${video.snippet.channelTitle} · 9x ditonton · ${postedAt(video.snippet.publishedAt)}",
              style: TextStyle(fontSize: 12),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
