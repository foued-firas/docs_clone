import 'package:flutter/material.dart';
class Login_screen extends StatelessWidget {
  const Login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(onPressed: (){}, icon:Image.asset('assets/g-logo-2.png', height: 20,) ,label: Text('Sign in with Google')),
      ),
    );
  }
}