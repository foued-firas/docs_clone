import 'package:docs_clone/colors.dart';
import 'package:docs_clone/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class Login_screen extends  ConsumerWidget {
  const Login_screen({super.key});
  void signInWithGoogle(WidgetRef ref){
    ref.read(
      authRepositoryProvider
    ).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    ref.watch(
      authRepositoryProvider
    ).signInWithGoogle();
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: ()=>  signInWithGoogle(ref), 
          icon:Image.asset('assets/g-logo-2.png', 
          height: 20,) ,
          label: Text('Sign in with Google',
          style: TextStyle(
            color: kBlackColor,
          ),),

          style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 50),
            backgroundColor: kwhiteColor,
          )
          ),
      ),
    );
  }
}