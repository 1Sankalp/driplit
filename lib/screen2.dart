import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screen3.dart';  // Ensure you've created a file named screen3.dart

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dotted grey background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 40.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 35.0),
              onPressed: () {
                Navigator.pop(context);// Go back to previous screen (Screen1)
              },
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name field with Asterisk
                RichText(
                  text: TextSpan(
                    text: 'Enter your name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    children: <TextSpan>[
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),

                // SizedBox widget
                SizedBox(height: 10),

                // TextField widget for the name
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                    ),
                  ),
                ),

                // SizedBox widget
                SizedBox(height: 30),

                // Email field with Asterisk
                RichText(
                  text: TextSpan(
                    text: 'Enter your ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '.edu', style: TextStyle(color: Color(0xFFFFA700))),
                      TextSpan(text: ' email', style: TextStyle(color: Colors.black)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),

                // SizedBox widget
                SizedBox(height: 10),

                // TextField widget for the email with example
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'ex. john@college.edu',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                ),
              ),

                // SizedBox widget
                SizedBox(height: 30),

                // Icon Button for the Next arrow
                Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFFFFA700),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 35.0),
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          !_emailController.text.endsWith('.edu')) {
                        // Show an error dialog if the name is empty or email doesn't end with .edu
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please provide a valid name and .edu email address."),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Navigate to Screen3 if the inputs are valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Screen3(
                              name: _nameController.text,
                              email: _emailController.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
