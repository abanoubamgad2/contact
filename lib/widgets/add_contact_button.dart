import 'package:flutter/material.dart';

class AddContactButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddContactButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xfff2e5cc),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
