import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/contact.dart';

class ContactService {
  static const String _contactsKey = 'contacts';

  static Future<List<Contact>> getContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getStringList(_contactsKey) ?? [];

    return contactsJson.map((json) {
      final Map<String, dynamic> contactMap = jsonDecode(json);
      return Contact.fromJson(contactMap);
    }).toList();
  }

  static Future<void> saveContact(Contact contact) async {
    final contacts = await getContacts();
    contacts.add(contact);
    await _saveContacts(contacts);
  }

  static Future<void> updateContact(Contact updatedContact) async {
    final contacts = await getContacts();
    final index = contacts.indexWhere((c) => c.id == updatedContact.id);
    if (index != -1) {
      contacts[index] = updatedContact;
      await _saveContacts(contacts);
    }
  }

  static Future<void> deleteContact(String contactId) async {
    final contacts = await getContacts();
    contacts.removeWhere((c) => c.id == contactId);
    await _saveContacts(contacts);
  }

  static Future<void> _saveContacts(List<Contact> contacts) async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = contacts.map((contact) {
      return jsonEncode(contact.toJson());
    }).toList();
    await prefs.setStringList(_contactsKey, contactsJson);
  }
}
