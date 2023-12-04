import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1.5,
          backgroundColor: Colors.blue,
          title: const Text('Fetch Data')),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                          Image.network(snapshot.data!.docs[index]['image']),
                      title: Text(snapshot.data!.docs[index]['title']),
                    );
                  });
            }
          }),
    );
  }
}
