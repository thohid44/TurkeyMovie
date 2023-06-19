import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erthurul/Pages/web_View_page.dart';
import 'package:flutter/material.dart';

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
                      return ListTile(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>WebViewPage()));
                        },
                        title: Container(
                          child: Text(
                            snapshot.data!.docs[index].get("title").toString(),
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        subtitle: Container(
                          child: Text(
                            snapshot.data!.docs[index]
                                .get("subTitle")
                                .toString(),
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
