import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToFireBaseStorage(
      String childName, Uint8List file) async {
    Reference ref = _firebaseStorage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({required Uint8List file}) async {
    String resp = 'Some Error Occurred';
    try {
      String imageUrl =
          await uploadImageToFireBaseStorage('ProfileImage', file);
      _firebaseFirestore.collection('userProfile').add({
        'imageLink': imageUrl,
      });
      resp = 'success';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
