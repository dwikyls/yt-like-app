import 'package:flutter/material.dart';

//stateful widget card class
class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: Card(
        elevation: 4.0,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: 250,
                child: Image.asset(
                  'thumbnail.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle, size: 45),
                title: Text('Kontube Pesaing Youtube? Anjasss'),
                subtitle: Text('ht2p - 1 jt x ditonton - 1 hari yang lalu'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
