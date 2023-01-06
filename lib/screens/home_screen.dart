import 'package:flutter/material.dart';
import 'package:youtube_like_app/utils/constant.dart';
// import 'package:youtube_like_app/widgets/card_widget.dart';
import 'package:youtube_like_app/widgets/listCard_widget.dart';

//homepage class
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListCardWidget(),
    Text(
      'Index 1: Explore',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 2: Add',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 3: Subscription',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 4: Koleksi',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: Image.asset('youtube_logo.png'),
          title: const Text(
            'Kontube',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(right: 10, left: 10),
              icon: Icon(
                Icons.videocam_outlined,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(right: 10, left: 10),
              icon: Icon(
                Icons.notifications_none_outlined,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(right: 10, left: 10),
              icon: Icon(
                Icons.search_outlined,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(right: 10, left: 10),
              icon: Icon(
                Icons.account_circle_outlined,
                size: 25,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscription',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: 'Koleksi',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kMainColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ));
  }
}
