import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olo_takehome/src/models/note.dart';

class NoteRepository {
  Future<Note?> createNewFlutterNote(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    Note? note;

    return showDialog<Note?>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Create new note'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Title'),
                controller: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Body'),
                controller: bodyController,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              note = Note(
                title: titleController.text,
                body: bodyController.text,
                lastModified: DateTime.now(),
              );

              titleController.clear();
              bodyController.clear();
              Navigator.pop(context, note);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<Note?> createNewAndroidNote() async {
    const platform = MethodChannel('com.example.olo_takehome/note');
    Note? note;
    try {
      final result = await platform.invokeMethod('createNote');

      Map<String, dynamic> map = {
        'title': result['title'],
        'body': result['body'],
        'lastModified': result['lastModified']
      };

      note = Note.fromJson(map);
    } on PlatformException catch (e) {
      print(e);
    }

    return Future.value(note);
  }
}
