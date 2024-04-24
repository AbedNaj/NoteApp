import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.onSaved,
      this.editText,
      this.onChange});

  final String title;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? editText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        initialValue: editText,
        onSaved: onSaved,
        onChanged: onChange,
        maxLines: maxLines,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field Is Required';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: title,
          border: outlineInput(Colors.blueAccent),
          enabledBorder: outlineInput(Colors.blueAccent),
          focusedBorder: outlineInput(Colors.purpleAccent),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInput(Color bordercolor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: bordercolor,
      ),
    );
  }
}
