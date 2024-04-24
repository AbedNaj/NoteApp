import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/widgets/my_app_bar.dart';
import 'package:noteapp/widgets/my_text.field.dart';

class NotesEdit extends StatefulWidget {
  const NotesEdit({super.key, required this.note});
  final NoteModel note;

  @override
  State<NotesEdit> createState() => _NotesEditState();
}

class _NotesEditState extends State<NotesEdit> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        title: 'Edit Note',
        buttonPress: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.subTitle = content ?? widget.note.subTitle;
          widget.note.save();
          BlocProvider.of<NotesCubit>(context).notesDisplay();
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            title: 'Title',
            editText: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 5,
          ),
          MyTextField(
            onChange: (value) {
              content = value;
            },
            title: 'Content',
            maxLines: 4,
            editText: widget.note.subTitle,
          )
        ],
      ),
    );
  }
}
