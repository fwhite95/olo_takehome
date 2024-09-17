import 'package:flutter/material.dart';
import 'package:olo_takehome/src/repository/note_repository.dart';

import '../models/note.dart';

class NoteLogic {
  final NoteRepository _noteRepository;
  final List<Note> notes = [];

  NoteLogic({
    required NoteRepository noteRepository,
  }) : _noteRepository = noteRepository;

  Future<void> createNote(BuildContext context) async {
    //Note? note = await _noteRepository.createNewFlutterNote(context);
    Note? note = await _noteRepository.createNewAndroidNote();

    if (note != null) {
      notes.add(note);
    }
  }
}
