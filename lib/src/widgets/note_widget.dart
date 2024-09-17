import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    String monthDayYear =
        '${note.lastModified.toLocal().month.toString()}/${note.lastModified.toLocal().day.toString()}/${note.lastModified.toLocal().year.toString()} ';
    String time =
        '${note.lastModified.toLocal().hour.toString()}:${note.lastModified.toLocal().minute.toString()}:${note.lastModified.toLocal().second.toString()}';
    String formattedDate = monthDayYear + time;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Text(
              'Last Modified: $formattedDate',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              note.body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
