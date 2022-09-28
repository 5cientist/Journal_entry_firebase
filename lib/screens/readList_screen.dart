import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal_app_firebase/components.dart';
import 'package:journal_app_firebase/constants.dart';
import 'package:journal_app_firebase/screens/add_entry_screen.dart';

class ReadEntryScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadEntryScreen({Key? key, required this.docs}) : super(key: key);

  @override
  State<ReadEntryScreen> createState() => _ReadEntryScreenState();
}

class _ReadEntryScreenState extends State<ReadEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: widget.docs.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    JournalTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please Add Entry',
                          style: kButtonText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    JournalButton(
                      label: 'Add Entry',
                      fn: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddEntryScreen();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 30,
                  ),
                  JournalTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return EntryTail(
                          title: widget.docs.elementAt(index)['Title'],
                          entry: widget.docs.elementAt(index)['Entry'],
                          dateTime: widget.docs.elementAt(index)['Date'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: widget.docs.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  JournalButton(
                      label: "BACK",
                      fn: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 30,
                  ),
                ]),
        ),
      ),
    );
  }
}
