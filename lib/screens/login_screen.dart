import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_like_app/utils/constant.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_like_app/utils/posted_at.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  serverClientId:
      '861644943841-87koudj0q1md5eel5jl3776qpvl0gfub.apps.googleusercontent.com',
  scopes: <String>[
    'https://www.googleapis.com/auth/youtube',
  ],
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const _baseUrl = 'www.googleapis.com';
  List<dynamic> _videos = [];
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });

      if (_currentUser != null) {
        //
      }
    });

    _getVideos();
    _googleSignIn.signInSilently();
  }

  Future<dynamic> _getVideos() async {
    try {
      Map<String, String> parameters = {
        'part': 'snippet',
        'key': 'AIzaSyBlLIEwyqTlfVot7C22t053RSdlgIGpvSs',
      };
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      Uri uri = Uri.https(
        _baseUrl,
        '/youtube/v3/search',
        parameters,
      );

      http.Response response = await http.get(uri, headers: headers);
      var _response = json.decode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        setState(() {
          _videos = _response['items'] as List;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;

    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          Text(_contactText),
          ElevatedButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () {
              //
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150, bottom: 50),
            width: 150,
            height: 150,
            decoration: circleContainer,
          ),
          ElevatedButton(
            onPressed: _handleSignIn,
            child: Text("Sign In with Google"),
          )
        ],
      );
    }
  }

  Future<void> _pullRefresh() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.circle, color: Colors.grey),
        title: Text("Youtube"),
        actions: [
          Icon(Icons.circle, color: Colors.grey),
          Icon(Icons.circle, color: Colors.grey),
          Icon(Icons.circle, color: Colors.grey),
          Icon(Icons.circle, color: Colors.grey),
        ],
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Center(
            child: Column(
              children: [
                ..._videos.map((video) {
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Image.network(
                          "${video['snippet']['thumbnails']['medium']['url']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.circle, color: Colors.grey),
                        title: Text(
                          "${video['snippet']['title']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${video['snippet']['channelTitle']} · 9x ditonton · ${postedAt(video['snippet']['publishedAt'])}",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert)),
                      ),
                    ],
                  );
                }).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         children: [
  //           Container(
  //             margin: const EdgeInsets.only(top: 150, bottom: 50),
  //             width: 150,
  //             height: 150,
  //             decoration: circleContainer,
  //           ),
  //           Text('Login with Google', style: kLabelTextStyle),
  //           Container(
  //             margin: const EdgeInsets.only(top: 10, bottom: 50),
  //             width: 70,
  //             height: 70,
  //             child: ElevatedButton(
  //                 onPressed: () {},
  //                 child: Image.asset('google_logo.png'),
  //                 style: ElevatedButton.styleFrom(
  //                   primary: Colors.grey,
  //                   onPrimary: Colors.black,
  //                   shape: const CircleBorder(),
  //                 )),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
