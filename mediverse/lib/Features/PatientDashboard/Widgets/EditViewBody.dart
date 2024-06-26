import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Custom_textfield_notes.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Edit_Note_ListView.dart';

String? titleNotesScreen, contentNotesScreen;

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 50,
          // ),
          // CustomAppBar(
          //   onPressed: () {
          //     widget.note.title = title ?? widget.note.title;
          //     widget.note.subTitle = content ?? widget.note.subTitle;
          //     widget.note.save();
          //     BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          //     Navigator.pop(context);
          //   },
          //   title: 'Edit Note',
          //   icon: Icons.check,
          // ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFieldNotes(
            onChanged: (value) {
              titleNotesScreen = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFieldNotes(
            onChanged: (value) {
              contentNotesScreen = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
