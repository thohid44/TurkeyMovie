import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erthurul/Pages/osman.dart';
import 'package:erthurul/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Turkey Series"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
                crossAxisSpacing: 10, 
                mainAxisSpacing: 10
                ),
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OsmanPage(title: "Kurulus Osman"))); 
                  },
                  child: ItemWidget("Arthurul")), 
                    InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OsmanPage(title: "Kurulus Osman"))); 
                  },
                  child: ItemWidget("Arthurul")),
                    InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OsmanPage(title: "Kurulus Osman"))); 
                  },
                  child: ItemWidget("Arthurul"))
            ],
          ),
        ));
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
        
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.deepPurple),
        child: Text(
          "$title",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
