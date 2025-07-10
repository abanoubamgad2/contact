import 'package:flutter/material.dart';

class EmptyContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
