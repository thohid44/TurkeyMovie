import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erthurul/admin/add_new_item.dart';
import 'package:erthurul/admin/add_series_name.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController collection = TextEditingController();
  final TextEditingController value = TextEditingController();
  final TextEditingController name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             InkWell(
              onTap: (){
                Get.to(AddNewItem()); 
              },
              child: Text("Add New Series Link"),
             ),

             SizedBox(height: 20,), 
               InkWell(
              onTap: (){
                Get.to(AddSeriesName()); 
              },
              child: Text("Add New Collection "),
             )
            ],
          ),
        ),
      ),
    );
  }

  register({
    required String name,
    required String value,
   
  }) async {

    


        FirebaseFirestore.instance.collection('series').add({
          'name': name,
          'value': value,
       
        });
      
       
      }
 
  
  
  
}