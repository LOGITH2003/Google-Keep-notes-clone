
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:loacal_notes/src/model/note.dart';
import 'package:loacal_notes/src/service/local_db.dart';

class CreatenoteView extends StatefulWidget {
  const CreatenoteView({super.key});

  @override
  State<CreatenoteView> createState() => _CreatenoteViewState();
}

class _CreatenoteViewState extends State<CreatenoteView> {
  
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final localDB = LocalDBService();

  @override
  void dispose() {
    super.dispose();

    
    log(_titleController.text);
    log(_descriptionController.text);

    final title = _titleController.text;
    final desc = _descriptionController.text;

    final newNote = Note(
      id : Isar.autoIncrement,
      title : title,
      description: desc,
      lastMod : DateTime.now()
    );

    localDB.saveNote(note: newNote);

    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                style: GoogleFonts.poppins(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description",
                ),
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
