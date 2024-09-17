import 'package:flutter/material.dart';
import 'package:olo_takehome/src/logic/note_logic.dart';
import 'package:olo_takehome/src/repository/note_repository.dart';

import '../models/note.dart';
import '../widgets/note_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> notes = [];

  NoteLogic noteLogic = NoteLogic(noteRepository: NoteRepository());

  @override
  void initState() {
    super.initState();
    noteLogic = NoteLogic(noteRepository: NoteRepository());
  }

  _createNote() async {
    await noteLogic.createNote(context);
    setState(() {
      notes = noteLogic.notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: notes.isEmpty
          ? const Center(
              child: Text('Create a new note'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteWidget(
                  note: notes[index],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNote();
        },
        tooltip: 'Create new note',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
