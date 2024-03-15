import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("crop details".tr),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("upload").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
            itemCount: streamSnapshot.data?.docs.length,
            itemBuilder: (ctx, index) => (streamSnapshot.data != null)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          streamSnapshot.data?.docs[index]['picture'] == null
                              ? CircularProgressIndicator()
                              : Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        streamSnapshot.data?.docs[index]
                                            ['picture'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                streamSnapshot.data?.docs[index]['name'],
                                style: GoogleFonts.lato(
                                  color: Colors.green[1000],
                                ),
                              ),
                              Text(
                                streamSnapshot.data?.docs[index]['date'],
                                style: GoogleFonts.lato(
                                  color: Colors.green[1000],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
