import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:loacal_notes/src/model/note.dart';
import 'package:loacal_notes/src/view/widget/note_grid_item.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index, animation) {
        return NoteGridItem(note: notes[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: notes.length,
      options: const LiveOptions(),
    );
  }
}
