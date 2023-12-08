import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool _isObscured = true;
  IconData _eyeIcon = Icons.visibility_off;

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

          // Back button
          Positioned(
            top: 40.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 35.0),
              onPressed: () {
                Navigator.pop(context); // Go back to Screen1
              },
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // .edu email field
                  RichText(
                    text: TextSpan(
                      text: 'Enter your ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '.edu',
                          style: TextStyle(
                            color: Color(0xFFFFA700),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(height: 1.5),
                    decoration: InputDecoration(
                      hintText: 'ex. john@college.edu',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                    ),
                  ),

                  // Spacing
                  SizedBox(height: 30),

                  // Password field
                  RichText(
                    text: TextSpan(
                      text: 'Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  TextField(
                    obscureText: _isObscured,
                    style: TextStyle(height: 1.5),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: IconButton(
                        icon: Icon(_eyeIcon),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                            _eyeIcon = _isObscured ? Icons.visibility_off : Icons.visibility;
                          });
                        },
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 5.0),
                      ),
                    ),
                  ),

                  // Spacing
                  SizedBox(height: 50),

                  // Log in button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFA700)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 22),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Implement Log In functionality
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
