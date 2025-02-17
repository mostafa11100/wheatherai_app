import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseFireStoreNetowrk {
  FirebaseFirestore? _db;

  setdata({collection, docs, data}) async {
    _db = FirebaseFirestore.instance;

    await _db!
        .collection(collection)
        .doc(docs)
        .set(data, SetOptions(merge: true));
  }

  Future<DocumentReference<Map<String, dynamic>>> adddata({
    collection,
    data,
  }) async {
    _db = FirebaseFirestore.instance;

    DocumentReference<Map<String, dynamic>> result = await _db!
        .collection(collection)
        .add(data);
    return result;
  }

  update({collection, docs, data}) async {
    final washingtonRef = _db!.collection(collection).doc(docs);
    await washingtonRef.update(data);
  }

  delete({collection, docs, data}) async {
    _db!.collection(collection).doc(docs).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getdata({
    collection,
    docs,
  }) async {
    final docRef = _db!.collection(collection).doc(docs);
    DocumentSnapshot<Map<String, dynamic>> result = await docRef.get();
    return result;
  }
}
