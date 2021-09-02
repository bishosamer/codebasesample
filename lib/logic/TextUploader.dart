import 'package:cloud_firestore/cloud_firestore.dart' as db;

uploadText({String col, String doc, String name, Map<String, String> data}) {
  db.Firestore.instance.collection(col).document(doc).setData(data);
}

uploadToCol({String col, Map<String, String> data}) {
  db.Firestore.instance.collection(col).document().setData(data);
}

uploadtoClient(
    {String client, String project, String doc, String name, String text}) {
  var data = new Map<String, dynamic>();
  data = {name: text};
  db.Firestore.instance
      .collection('clients')
      .document(client)
      .collection(project)
      .document(doc)
      .setData(data);
}
