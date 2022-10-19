import "dart:io";

import "package:firebase_storage/firebase_storage.dart";

class FileRepository {
  final FirebaseStorage _firebaseStorage;

  FileRepository(this._firebaseStorage);

  Future uploadFile(File file) async {
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference reference = _firebaseStorage.ref().child(fileName);
    final UploadTask uploadTask = reference.putFile(file);
    return uploadTask.then((res) {
      res.ref.getDownloadURL();
    });
  }
}
