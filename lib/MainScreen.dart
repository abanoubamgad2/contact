import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 56, 77, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 56, 77, 1),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 39,
            width: 117,
            child: Image(
              image: AssetImage('assets/images/route.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        leadingWidth: 117 + 16,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
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
            SizedBox(height: 260),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    backgroundColor: Color(0xfff2e5cc),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
