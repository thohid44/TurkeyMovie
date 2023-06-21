import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erthurul/Pages/web_View_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class OsmanPage extends StatefulWidget {
  const OsmanPage({super.key, required this.title});

  final String title;

  @override
  State<OsmanPage> createState() => _OsmanPageState();
}

class _OsmanPageState extends State<OsmanPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('turkeyFilm')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      print(snapshot.data!.docs);
                      return Card(
                        child: ListTile(
                          
                          onTap: () async{
                        FlutterClipboard.copy(   snapshot.data!.docs[index].get("title").toString());
                                           
                          },
                          title: Container(
                            child: Text(
                              snapshot.data!.docs[index].get("title").toString(),
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get("subTitle")
                                  .toString(),
                              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          trailing: IconButton(onPressed:(){
                                      
                          }, icon: Icon(Icons.copy)),
                        ),
                      );
                    });
              })),
    );
  }
}
