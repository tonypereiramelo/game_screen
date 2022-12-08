import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/upload_videos/infrastructure/core/firestore_helpers.dart';

class UploadRepository {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (_) {
      return null;
    }
  }

  static Future createDocument(TeamModel teamModel, String uid) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('shots')
          .doc(uid)
          .withConverter(
            fromFirestore: fromFirestore,
            toFirestore: toFirestore,
          );
      return await docRef
          .set(teamModel)
          .timeout(const Duration(seconds: 50))
          .then((value) => teamModel);
    } catch (e) {
      return log(e.toString());
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (_) {
      return null;
    }
  }
}
