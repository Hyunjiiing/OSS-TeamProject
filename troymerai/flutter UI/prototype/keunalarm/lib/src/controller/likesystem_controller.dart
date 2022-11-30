import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
/*
class likeSystemController extends GetxController {
  // CollectionReference event = FirebaseFirestore.instance.collection('events');

  static likeSystemController get to => Get.find();
  var likeSystemList = <fireStoreEvent>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updatelikeIno() {
    if (likeSystemList.contains(fireStoreEvent)) {
      fireStoreEvent.setLikeSystem(false);
      likeSystemList.remove(fireStoreEvent);
    } else {
      fireStoreEvent.setLikeSystem(true);
      likeSystemList.add(fireStoreEvent as fireStoreEvent);
    }
  }
}
*/