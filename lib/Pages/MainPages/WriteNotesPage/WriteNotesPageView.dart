import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyNotesController.dart';

class WriteNotesPage extends StatefulWidget {
  const WriteNotesPage({Key? key}) : super(key: key);

  @override
  State<WriteNotesPage> createState() => _WriteNotesPageState();
}

class _WriteNotesPageState extends State<WriteNotesPage> {
  MyNotesController _notesController = MyNotesController();
  late String _note = '';

  late final TextEditingController _textController =
      TextEditingController(text: '');

  loadNote() async {
    String newNote = await _notesController.readNotes();
    setState(() {
      _note = newNote;
      _textController.text = newNote;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadNote());
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        showCursor: true,
        controller: _textController,
        onSubmitted: ((value) {
          _notesController.saveNotes(value);
        }),
      ),
    );
  }
}
