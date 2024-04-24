import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteapp/models/note_model.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import '../widgets/color_picker.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_text.field.dart';

class AddNoteFormState extends StatefulWidget {
  const AddNoteFormState({
    super.key,
  });

  @override
  State<AddNoteFormState> createState() => _AddNoteFormStateState();
}

class _AddNoteFormStateState extends State<AddNoteFormState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                title: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              MyTextField(
                title: 'Content',
                maxLines: 4,
                onSaved: (value) {
                  subTitle = value;
                },
              ),
              const ColorPicker()
            ],
          ),
          mySaveButton(context),
        ],
      ),
    );
  }

  Padding mySaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: MyElevatedButtom(
        addTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            var noteModels = NoteModel(
                title: title!,
                subTitle: subTitle!,
                date: DateFormat('yyyy-MM-dd').format(now).toString(),
                color: Colors.blue.value);

            BlocProvider.of<AddNoteCubit>(context).addNote(noteModels);
            BlocProvider.of<NotesCubit>(context).notesDisplay();
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        },
      ),
    );
  }
}
