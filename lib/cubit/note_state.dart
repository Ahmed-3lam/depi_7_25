part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class AddNewNoteState extends NoteState {}

final class UpdateNoteState extends NoteState {}

final class DeleteNoteState extends NoteState {}
