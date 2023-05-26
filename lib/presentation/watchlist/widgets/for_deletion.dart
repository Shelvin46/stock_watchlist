import 'package:flutter/material.dart';

class ForDeletion extends StatelessWidget {
  const ForDeletion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert!!"),
      content: Text("Do you Want to Delete this Stock?"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Text("No"),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Text("Yes"),
        ),
      ],
    );
  }
}