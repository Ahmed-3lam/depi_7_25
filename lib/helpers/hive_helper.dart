import 'package:hive/hive.dart';

class HiveHelper {
  static const noteBox = "NOTE_BOX";
  static const noteKey = "noteKey";

  static List<String> myNotes = [];
  static var box = Hive.box(noteBox);

  static void addNote(String noteText) async {
    myNotes.add(noteText);
    await box.put(noteKey, myNotes);
  }

  static Future<void> getMyNotes() async {
    myNotes = box.get(noteKey);
  }

  static void removeNote(int index) async {
    myNotes.removeAt(index);
    await box.put(noteKey, myNotes);
  }

  static void removeAllNote() async {
    myNotes = [];
    await box.put(noteKey, myNotes);
  }

  static void updateNote(String noteText, int index) async {
    myNotes[index] = noteText;
    await box.put(noteKey, myNotes);
  }
}

///Note App:
// (1) add note (done )
// (2) remove note ( done )
// (3) remove all notes (done)
// (4) update note (done )
