import 'package:docs_clone/colors.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
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
              size: 16,
            
            ),
             label: Text('Share'),
             style: ElevatedButton.styleFrom(
              backgroundColor: kblueColor,
             ),
            ),
         )
        ],
        title: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            children: [
              Image.asset('assets/docs-logo.png',
              height: 40,),
              SizedBox(height: 10,),
              SizedBox(
                width: 180,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kblueColor
                      )
                    ),
                    contentPadding: EdgeInsets.only(left: 10)
                  ),
                  
                ),
              )
            ],
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
              SizedBox(height: 10,),
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