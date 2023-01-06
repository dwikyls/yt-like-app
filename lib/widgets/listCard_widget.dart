import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_like_app/providers/video_provider.dart';
import 'package:youtube_like_app/widgets/card_widget.dart';

class ListCardWidget extends StatefulWidget {
  const ListCardWidget({Key? key}) : super(key: key);

  @override
  _ListCardWidgetState createState() => _ListCardWidgetState();
}

class _ListCardWidgetState extends State<ListCardWidget> {
  var _isInit = true;
  var _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<Videos>(context, listen: false).fetchAndSetVideos();
    }

    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    var _videos = Provider.of<Videos>(context).videos!.items;

    return _videos.isNotEmpty
        ? Column(
            children: _videos.map((video) => CardWidget(video: video)).toList(),
          )
        : CircularProgressIndicator();
  }
}
