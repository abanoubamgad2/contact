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
                    onPressed: () {
                      showModalBottomSheet(
                        //isDismissible: false,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(41, 56, 77, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),

                            height: 500,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                                side: BorderSide(
                                                  color: Color(0xfff2e5cc),
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                              Color.fromRGBO(41, 56, 77, 1),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Image(
                                            image: AssetImage(
                                              'assets/images/image.png',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Text('User name ',
                                                style: TextStyle(
                                                  color: Color(0xfff2e5cc),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(height: 10),
                                            Image(image: AssetImage(
                                              'assets/images/Line.png',
                                            )),
                                            SizedBox(height: 10),
                                            Text('example @ email.com',
                                                style: TextStyle(
                                                  color: Color(0xfff2e5cc),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(height: 10),
                                            Image(image: AssetImage(
                                              'assets/images/Line.png',
                                            )),
                                            SizedBox(height: 10),
                                            Text('Phone number',
                                                style: TextStyle(
                                                  color: Color(0xfff2e5cc),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      enabled: true,
                                      style: TextStyle(
                                        color: Color(0xfff2e5cc),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'User Name',
                                        labelStyle: TextStyle(
                                          color: Color(0xfff2e5cc),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      enabled: true,
                                      style: TextStyle(
                                        color: Color(0xfff2e5cc),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Color(0xfff2e5cc),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      enabled: true,
                                      style: TextStyle(
                                        color: Color(0xfff2e5cc),
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Phone Number',
                                        labelStyle: TextStyle(
                                          color: Color(0xfff2e5cc),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xfff2e5cc),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty
                                                .all(
                                              Color(0xfff2e5cc),
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(25),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Enter User',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  41, 56, 77, 1),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
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
