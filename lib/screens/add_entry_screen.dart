import 'package:flutter/material.dart';
import 'package:journal_app_firebase/components.dart';
import 'package:journal_app_firebase/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController entryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    final h=MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kScreenBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            JournalTitle(),
            SizedBox(height: 10,),
            Container(
              width: w*0.8,
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 10,
              ),
              decoration:kTextFiled,
              child: TextFormField(
                controller: titleController,
                cursorColor: Colors.white,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Entery Title *',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Container(
                width: w*0.8,
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15,),),
                ),
                child: SingleChildScrollView(
                  reverse: entryController.text.length>20?true:false,
                  child: TextFormField(
                    controller: entryController,
                    cursorColor: Colors.white,
                    maxLines: 15,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Create new entery',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            JournalButton(label: 'Save', fn: () async{
              if(titleController.text.isEmpty || entryController.text.isEmpty){
                print("enter title and entry");

              }else{
                await FirebaseFirestore.instance.collection('entry').add({
                  'Title':titleController.text,
                  'Entry':entryController.text,
                  'Date':DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                }).then((value) => print("Entery added sucessfully"),).catchError((error)=>print("Entry not added due to $error"));
                titleController.clear();
                entryController.clear();
              }
            }),
            SizedBox(height: 40,),

          ],
        ),
      ),
    ),);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    entryController.dispose();
    super.dispose();
  }
}
