import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erthurul/Pages/osman.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin/adminPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Turkey Movie',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OsmanPage(title: '',));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("test"),
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('series')
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
                        FlutterClipboard.copy(   snapshot.data!.docs[index].get("name").toString());
                                           
                          },
                          title: Container(
                            child: Text(
                              snapshot.data!.docs[index].get("name").toString(),
                              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                       
                          trailing: IconButton(onPressed:(){
                            Get.to(OsmanPage(title:  snapshot.data!.docs[index].get("name").toString() ), 
                            arguments:   snapshot.data!.docs[index].get("value").toString()
                            );
                                      
                          }, icon: Icon(Icons.arrow_forward)),
                        ),
                      );
                    });
              })),
    );
  }
}

class ItemWidget extends StatelessWidget {
  String? title;
  ItemWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 50,
        
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.purple),
        child: Text(
          "$title",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
