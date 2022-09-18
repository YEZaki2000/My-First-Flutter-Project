import 'package:flutter/material.dart';
import 'WriteNotesPage/MyNotesController.dart';
import "package:flutter/scheduler.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// SECOND SCREEN (Tutorial screen)

// FIRST SCREEN STATE
class _MyHomePageState extends State<MyHomePage> {
  final MyNotesController _notesController = MyNotesController();
  String _note = '';

  loadNote() async {
    String newNote = await _notesController.readNotes();
    setState(() {
      _note = newNote;
    });
  }

  // @override
  // void initState() {
  //   loadNote();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadNote());
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('My Notes'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: ((dynamic value) =>
                    Navigator.pushNamed(context, value)),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                          value: '/Settings', child: Text("Settings")),
                    ])
          ],
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Title"),
              subtitle: Text(_note),
              isThreeLine: true,
              onTap: (() => Navigator.pushNamed(context, "/WriteNotesPage")),
            ),
            const ListTile(
              title: Text("Title"),
              subtitle: Text("Subtitle"),
              isThreeLine: true,
            )
          ],
        ));
  }
}
