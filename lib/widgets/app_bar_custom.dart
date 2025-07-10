import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
