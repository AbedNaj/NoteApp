import 'package:flutter/material.dart';

import '../views/model_sheet_view.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const ModelSheetView();
          },
        );
      },
      backgroundColor: const Color.fromARGB(255, 3, 62, 111),
      child: const Icon(Icons.add),
    );
  }
}
