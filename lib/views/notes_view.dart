import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';

import '../widgets/card_list.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_floating_button.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().notesDisplay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: 'Notes',
        buttonPress: () {},
      ),
      body: const CardList(),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
