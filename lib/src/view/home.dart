import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loacal_notes/src/service/local_db.dart';
//import 'package:loacal_notes/src/service/local_db.dart';
import 'package:loacal_notes/src/view/create_note.dart';
import 'package:loacal_notes/src/view/widget/empty_view.dart';
import '../res/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
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
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                    },
                    icon: Icon(isListView
                        ? Icons.splitscreen_rounded
                        : Icons.grid_view_rounded),
                  ),
                ],
              ),
            ),
            //const Emptyview(),
            Expanded(
              child: StreamBuilder(
                stream: LocalDBService().listenAllNotes(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Emptyview();
                  }
                  final notes = snapshot.data!;
                  return ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return const Text("{notes[index].title}");
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreatenoteView(),
            ),
          );
        },
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
