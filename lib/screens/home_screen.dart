import 'package:docs_clone/colors.dart';
import 'package:docs_clone/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(

     
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add, color: kBlackColor,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout, color: kredColor,))
        ],
      ),
      body: Center(
        child: Text(ref.watch(
          userProvider
        )!.email,
         )
      ),
    );
  }
}