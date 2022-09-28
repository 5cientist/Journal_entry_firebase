import 'package:flutter/material.dart';
import 'package:journal_app_firebase/components.dart';
import 'package:journal_app_firebase/constants.dart';
import 'package:journal_app_firebase/screens/add_entry_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal_app_firebase/screens/readList_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JournalTitle(),
              SizedBox(
                height: h * 0.045,
              ),
              Image(
                image: AssetImage('images/journal.png'),
                width: w * 0.51,
                height: h * 0.23,
              ),
              SizedBox(
                height: h * 0.08,
              ),
              JournalButton(label: 'Read Entery', fn: () async{
                await FirebaseFirestore.instance.collection('entry').get().then((snapshot){
                  List<QueryDocumentSnapshot> docList = snapshot.docs;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadEntryScreen(docs: docList)));
                });
              }),
              SizedBox(
                height: 20,
              ),
              JournalButton(label: 'Add Entery', fn: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEntryScreen(),),);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
