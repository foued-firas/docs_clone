import 'package:docs_clone/constants.dart';
import 'package:docs_clone/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'dart:convert';
final authRepositoryProvider   = Provider(
  (ref) => AuthRepository(googleSignIn: GoogleSignIn(), client: Client(),
  ),
);

final userProvider =StateProvider<UserModel?>((ref) =>null);

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final Client _client;

  AuthRepository(  {
    
   
    required GoogleSignIn googleSignIn,
    required Client client,
    }) : _googleSignIn = googleSignIn,
     _client = client;

    void signInWithGoogle()async{
      try{
       final user = await  _googleSignIn.signIn();
       if(user!=null){
      final userAcc =UserModel(
        email: user.email,
         name: user.displayName!,
          profilePic: user.photoUrl!,
           uid: '', token: '',
           );
       var res = await     _client.post(
            Uri.parse('$host/api/signup'),
           body: userAcc.toJson(),
            headers: {
               'Content-Type': 'application/json; charset=UTF-8', // accept the json model
         

            }
            );
            switch(res.statusCode){
              case 200:
              final newUser = userAcc.copyWith(

                  uid: jsonDecode(res.body)['user']['_id'],
              );
              break; 
                           
            }
           

       }

      }catch(e){
        print(e);
      }
    }
}