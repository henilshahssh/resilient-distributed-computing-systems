import 'package:flutter/material.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'monitor.node',
              style: TextStyle(
                fontSize: 64,
                // Flutter uses logical pixels, not sp
                fontFamily: 'Inter',
                // Replace 'NotoSans' with your actual font family
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF015249),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 387,
              height: 67,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 387,
              height: 67,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Password',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
