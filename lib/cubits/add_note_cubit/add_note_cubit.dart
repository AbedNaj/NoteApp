import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:hive/hive.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? sColor = const Color(0xff1976D2);
  addNote(NoteModel noteModel) async {
    noteModel.color = sColor!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      emit(AddNoteSucess());

      await notesBox.add(noteModel);
    } on Exception catch (e) {
      emit(AddNoteFaliure(errMessage: e.toString()));
    }
  }
}
