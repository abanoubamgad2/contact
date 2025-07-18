import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactBottomSheet {
  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    required File? contactImage,
    required Function(File?) onImageSelected,
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String name = '';
            String email = '';
            String phone = '';
            File? currentImage = contactImage;

            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(41, 56, 77, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSection(
                      context,
                      currentImage,
                          (image) {
                        setState(() {
                          currentImage = image;
                        });
                        onImageSelected(image);
                      },
                      setState,
                    ),
                    _buildFormFields(
                      onNameChanged: (text) => name = text,
                      onEmailChanged: (text) => email = text,
                      onPhoneChanged: (text) => phone = text,
                    ),
                    _buildSaveButton(
                      context,
                          () => name,
                          () => email,
                          () => phone,
                          () => currentImage,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildImageSection(
    BuildContext context,
    File? contactImage,
    Function(File?) onImageSelected,
    StateSetter setState,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 125,
            height: 125,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xfff2e5cc), width: 2),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(41, 56, 77, 1),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 85,
                );
                if (pickedFile != null) {
                  final file = File(pickedFile.path);
                  setState(() {
                    contactImage = file;
                  });
                  if (await file.exists()) {
                    setState(() {
                      onImageSelected(file);
                    });
                  }
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: contactImage != null
                    ? Image.file(

                        contactImage,
                        width: 125,
                        height: 125,
                        fit: BoxFit.cover,

                      )
                    : Image.asset(
                        'assets/images/image.png',
                        width: 125,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'User name',
                style: TextStyle(
                  color: Color(0xfff2e5cc),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Image(image: AssetImage('assets/images/Line.png')),
              SizedBox(height: 10),
              Text(
                'example@email.com',
                style: TextStyle(
                  color: Color(0xfff2e5cc),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Image(image: AssetImage('assets/images/Line.png')),
              SizedBox(height: 10),
              Text(
                'Phone number',
                style: TextStyle(
                  color: Color(0xfff2e5cc),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildFormFields({
    required Function(String) onNameChanged,
    required Function(String) onEmailChanged,
    required Function(String) onPhoneChanged,
  }) {
    return Column(
      children: [
        _buildTextField('User Name', onNameChanged),
        _buildTextField('Email', onEmailChanged),
        _buildTextField('Phone Number', onPhoneChanged),
      ],
    );
  }

  static Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        enabled: true,
        style: TextStyle(color: Color(0xfff2e5cc)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Color(0xfff2e5cc)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff2e5cc)),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff2e5cc)),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  static Widget _buildSaveButton(
    BuildContext context,
      String Function() getName,
      String Function() getEmail,
      String Function() getPhone,
      File? Function() getImage,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xfff2e5cc)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              onPressed: () {
                final contactData = {
                  'name': getName(),
                  'email': getEmail(),
                  'phone': getPhone(),
                  'image': getImage(),
                };
                Navigator.pop(context, contactData);
              },
              child: Text(
                'Enter User',
                style: TextStyle(
                  color: Color.fromRGBO(41, 56, 77, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
