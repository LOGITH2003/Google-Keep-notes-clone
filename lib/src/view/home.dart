import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loacal_notes/src/service/local_db.dart';
import 'package:loacal_notes/src/view/create_note.dart';
import 'package:loacal_notes/src/view/widget/empty_view.dart';
import 'package:loacal_notes/src/view/widget/notes_grid.dart';
import 'package:loacal_notes/src/view/widget/notes_list.dart';
import '../res/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.appName,
                    style: GoogleFonts.poppins(fontSize: 24),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      isListView = !isListView;
                    });
                  }, icon: Icon(isListView ? Icons.splitscreen_outlined : Icons.grid_view)),
                ],
              ),
            ),
            // const EmptyView(),
            Expanded(
              child: StreamBuilder(
                stream: LocalDBService().listenAllNotes(),
                builder: (context, snapshot) {
                  if(snapshot.data==null){
                    return const Emptyview();
                  }
                  final notes = snapshot.data!;

                  // if(isListView){
                  //   return NotesList(notes: notes);
                  // }
                  // return NotesGrid(notes: notes);

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isListView ? NotesList(notes: notes) : NotesGrid(notes: notes),
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateNoteView()));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.grey,),
      ),
    );
  }
}

