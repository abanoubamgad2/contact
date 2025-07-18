import 'dart:io';

import 'package:contact2/models/contact.dart';
import 'package:contact2/services/contact_service.dart';
import 'package:contact2/widgets/add_contact_bottom_sheet.dart';
import 'package:contact2/widgets/add_contact_button.dart';
import 'package:contact2/widgets/app_bar_custom.dart';
import 'package:contact2/widgets/contact_list_view.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? _contactImage;
  final GlobalKey<ContactListViewState> _contactListKey = GlobalKey();

  void _showAddContactBottomSheet() async {
    final result = await AddContactBottomSheet.show(
      context,
      contactImage: _contactImage,
      onImageSelected: (image) {
        setState(() {
          _contactImage = image;
        });
      },
    );

    if (result != null && result is Map<String, dynamic>) {
      final String name = result['name'] ?? '';
      final String email = result['email'] ?? '';
      final String phone = result['phone'] ?? '';
      final File? image = result['image'];

      if (name.isNotEmpty || email.isNotEmpty || phone.isNotEmpty) {
        final contact = Contact(
          id: DateTime
              .now()
              .millisecondsSinceEpoch
              .toString(),
          name: name,
          email: email,
          phone: phone,
          image: image,
        );

        try {
          await ContactService.saveContact(contact);
          setState(() {
            _contactImage = null;
          });
          _refreshContactList();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Contact added successfully'),
              backgroundColor: Color(0xfff2e5cc),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error adding contact: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void _refreshContactList() {
    _contactListKey.currentState?.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 56, 77, 1),
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Expanded(
            child: ContactListView(
              key: _contactListKey,
              onContactsChanged: () => setState(() {}),
            ),
          ),
          AddContactButton(
            onPressed: _showAddContactBottomSheet,
          ),
        ],
      ),
    );
  }
}
