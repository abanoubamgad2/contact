import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const ContactListItem({
    super.key,
    required this.contact,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfff2e5cc),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Color.fromRGBO(41, 56, 77, 1),
          backgroundImage: contact.image != null && contact.image!.existsSync()
              ? FileImage(contact.image!)
              : null,
          child: contact.image == null || !contact.image!.existsSync()
              ? Icon(Icons.person, color: Color(0xfff2e5cc), size: 30)
              : null,
        ),
        title: Text(
          contact.name.isNotEmpty ? contact.name : 'No Name',
          style: TextStyle(
            color: Color.fromRGBO(41, 56, 77, 1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (contact.email.isNotEmpty)
              Text(
                contact.email,
                style: TextStyle(
                  color: Color.fromRGBO(41, 56, 77, 0.7),
                  fontSize: 14,
                ),
              ),
            if (contact.phone.isNotEmpty)
              Text(
                contact.phone,
                style: TextStyle(
                  color: Color.fromRGBO(41, 56, 77, 0.7),
                  fontSize: 14,
                ),
              ),
          ],
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
