import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../helpers/hive_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void addNote(String text) {
    HiveHelper.addNote(text);
    emit(AddNewNoteState());
  }

  void updateNote(String text, int index) {
    HiveHelper.updateNote(text, index);
    emit(UpdateNoteState());
  }

  void deleteNote(int index) {
    HiveHelper.removeNote(index);
    emit(DeleteNoteState());
  }

  void deleteAllNote() {
    HiveHelper.removeAllNote();
    emit(DeleteNoteState());
  }
}
