import 'package:shared_preferences/shared_preferences.dart';

class MyNotesController {
  Future<void> saveNotes(String note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('MyNotes', note);
  }

  Future<String> readNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('MyNotes') ?? '';
  }
}
