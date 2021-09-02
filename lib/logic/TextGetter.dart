import 'package:cloud_firestore/cloud_firestore.dart' as db;

class TextGetter {
  static Future<Map> getDoc(String col, String doc) async {
    Map data;
    await db.Firestore.instance
        .collection(col)
        .document(doc)
        .get()
        .then((value) => data = value.data);
    return data;
  }

  static Future<db.QuerySnapshot> getDocs(String col) async {
    db.QuerySnapshot snap =
        await db.Firestore.instance.collection(col).getDocuments();
    return snap;
  }

  static Future<Map> getDocFromIndex(String col, int index) async {
    Map data;
    db.QuerySnapshot snap =
        await db.Firestore.instance.collection(col).getDocuments();
    data = snap.documents.elementAt(index).data;
    return data;
  }
}
