import 'dart:io';

import 'package:contact2/widgets/add_contact_bottom_sheet.dart';
import 'package:contact2/widgets/add_contact_button.dart';
import 'package:contact2/widgets/app_bar_custom.dart';
import 'package:contact2/widgets/empty_contacts_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? _contactImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 56, 77, 1),
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Expanded(child: EmptyContactsView()),
          AddContactButton(
            onPressed: () => AddContactBottomSheet.show(
              context,
              contactImage: _contactImage,
              onImageSelected: (image) {
                setState(() {
                  _contactImage = image;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
