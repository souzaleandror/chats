import 'package:chats/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  Firestore.instance
      .collection("col")
      .document("doc")
      .setData({"texto": "daniel"});

  Firestore.instance
      .collection("mensagens")
      .document("msg1")
      .setData({"from": "daniel", "read": false, "texto": "tudo bem ?"});

  Firestore.instance
      .collection("mensagens")
      .document("msg2")
      .setData({"from": "Joao Bobao", "read": false, "texto": "tudo bem ?"});

  Firestore.instance
      .collection("mensagens")
      .document()
      .setData({"from": "Joao Bobao", "read": false, "texto": "tudo bem ?"});

  QuerySnapshot snapshot =
      await Firestore.instance.collection("mensagens").getDocuments();

  DocumentSnapshot docSnap = await Firestore.instance
      .collection("mensagens")
      .document("d78GfawpX8FuQ2PaaAO1")
      .get();

  snapshot.documents.forEach((data) {
    print(data.data);
    data.reference.updateData({"read": false});
  });

  Firestore.instance.collection("mensagens").snapshots().listen((dado) {
    dado.documents.forEach((d) {
      print(d.data);
    });
  });

  Firestore.instance
      .collection("mensagens")
      .document("d78GfawpX8FuQ2PaaAO1")
      .snapshots()
      .listen((dado) {
    print(dado.data);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.blue)),
      home: ChatScreen(),
    );
  }
}
