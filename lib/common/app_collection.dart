import 'package:cloud_firestore/cloud_firestore.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

var _store = FirebaseFirestore.instance;

CollectionReference<Map<String, dynamic>> usersCollection =
    _store.collection('users');

CollectionReference<Map<String, dynamic>> withdrawCollection =
    _store.collection('withdraw_history');
