import 'dart:convert';

import 'package:docs_clone/constants.dart';
import 'package:docs_clone/models/document_model.dart';
import 'package:docs_clone/models/error_model.dart';
import 'package:http/http.dart';

class DocumentRepository {
  final Client _client;
  DocumentRepository({
    required Client client ,

    
  }):_client =client;

  Future<ErrorModel> createDocument(token)async{
    ErrorModel error =ErrorModel(
      error: 'Some unexpected error occured.', 
      data: null,
      );

    try{
      var res = await _client.post(Uri.parse('$host/doc/create'), 
      headers:{
        'Content-Type' : 'application/json; charset=UTF-8',
        'x-auth-token' : token ,
      },
      body:  jsonEncode({
        'createAt' : DateTime.now().millisecondsSinceEpoch,
      }),
      );
      switch(res.statusCode){
        case 200:
        error = ErrorModel(error: null, data: DocumentModel.fromJson(res.body));
        break;

      }

    }catch(e){
      error =ErrorModel(error: e.toString(), data: null);

    }
    return error;
  }
}