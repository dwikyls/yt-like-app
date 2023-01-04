import 'package:flutter/material.dart';
import 'package:youtube_like_app/widgets/card_widget.dart';

class ListCardWidget extends StatefulWidget {
  const ListCardWidget({Key? key}) : super(key: key);

  @override
  _ListCardWidgetState createState() => _ListCardWidgetState();
}

class _ListCardWidgetState extends State<ListCardWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return const CardWidget();
      },
    );
  }
}
