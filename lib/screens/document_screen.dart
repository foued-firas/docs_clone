import 'package:docs_clone/colors.dart';
import 'package:docs_clone/models/document_model.dart';
import 'package:docs_clone/models/error_model.dart';
import 'package:docs_clone/repository/auth_repository.dart';
import 'package:docs_clone/repository/document_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentScreen extends ConsumerStatefulWidget {
  final String id;
  const DocumentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends ConsumerState<DocumentScreen> {
  TextEditingController titleController =TextEditingController(text: 'Untitled Document');
 final  quill.QuillController _controller =quill.QuillController.basic();
  ErrorModel? errorModel;
 @override
  void initState() {
   
    super.initState();
    fetchDocumentData();
  }
  void fetchDocumentData()async{
     errorModel =
    await ref.read(documentRepositoryProvider).getDocumentById(ref.read(userProvider)!.token ,widget.id
    );
    if(errorModel!.data!=null){
      titleController.text=(errorModel!.data as DocumentModel).title;
      setState(() {
        
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
  }

  void updateTitle(WidgetRef ref , String title){
    ref.read(documentRepositoryProvider).updateTitle(
      token: ref.read(userProvider)!.token,
       id: widget.id,
        title: title );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kwhiteColor ,
        elevation: 0,
        actions: [
         Padding(
          
           padding: const EdgeInsets.all(10.0),
           child: ElevatedButton.icon(
            
            onPressed: (){},
            
            icon: const Icon(
              
              Icons.lock,
              size: 14,
            
            ),
             label: const Text('Share'),
             style: ElevatedButton.styleFrom(
              backgroundColor: kblueColor,
             ),
            ),
         )
        ],
        title: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: SingleChildScrollView(
              child: Row(
                
                children: [
                  Image.asset('assets/docs-logo.png',
                  height: 24 ,),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 180,
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: TextField(
                     
                          controller: titleController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kblueColor
                              )
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            
                          ),
                          onSubmitted: (value)=>updateTitle(ref, value),
                          
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(1), 
        child: Container(
          decoration: BoxDecoration(
          border: Border.all(
            color: kGreyColor,
            width: 0.1
          ),
        ),))
      ),

        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              quill.QuillSimpleToolbar(
            controller: _controller,
            configurations: const quill.QuillSimpleToolbarConfigurations(),
          ),
          Expanded(
            child: SizedBox(
              width: 750,
              child: Card(
                color: kwhiteColor,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: quill.QuillEditor.basic(
                            controller: _controller,
                            
                            configurations: const quill.QuillEditorConfigurations(),
                            
                  ),
                ),
              ),
            ),
          )
            ],
          ),
        )
        
    );
  }
}