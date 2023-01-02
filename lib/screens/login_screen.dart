import 'package:flutter/material.dart';
import 'package:youtube_like_app/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150, bottom: 50),
              width: 150,
              height: 150,
              decoration: circleContainer,
            ),
            Text('Login with Google', style: kLabelTextStyle),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 50),
              width: 70,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Image.asset('google_logo.png'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                    shape: const CircleBorder(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
