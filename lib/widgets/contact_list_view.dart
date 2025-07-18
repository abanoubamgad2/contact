import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../services/contact_service.dart';
import 'contact_list_item.dart';

class ContactListView extends StatefulWidget {
  final Function? onContactsChanged;

  const ContactListView({super.key, this.onContactsChanged});

  @override
  State<ContactListView> createState() => ContactListViewState();
}

class ContactListViewState extends State<ContactListView> {
  List<Contact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    setState(() {
      isLoading = true;
    });

    try {
      final loadedContacts = await ContactService.getContacts();
      setState(() {
        contacts = loadedContacts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error loading contacts: $e')));
      }
    }
  }

  Future<void> _deleteContact(Contact contact) async {
    try {
      await ContactService.deleteContact(contact.id);
      await loadContacts();
      widget.onContactsChanged?.call();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Contact deleted successfully')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting contact: $e')));
      }
    }
  }

  void _showDeleteConfirmation(Contact contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(41, 56, 77, 1),
          title: Text(
            'Delete Contact',
            style: TextStyle(color: Color(0xfff2e5cc)),
          ),
          content: Text(
            'Are you sure you want to delete ${contact.name}?',
            style: TextStyle(color: Color(0xfff2e5cc)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: TextStyle(color: Color(0xfff2e5cc))),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteContact(contact);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: Color(0xfff2e5cc)));
    }

    if (contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/empty.png')),
            Text(
              'There is NO Contacts Added Here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfff2e5cc),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: loadContacts,
      color: Color(0xfff2e5cc),
      backgroundColor: Color.fromRGBO(41, 56, 77, 1),
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactListItem(
            contact: contact,
            onDelete: () => _showDeleteConfirmation(contact),
          );
        },
      ),
    );
  }
}
