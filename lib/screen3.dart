import 'package:flutter/material.dart';
import 'screen5.dart';

class Screen3 extends StatefulWidget {
  final String name;
  final String email;

  Screen3({required this.name, required this.email});

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool _isObscured = true;
  IconData _eyeIcon = Icons.visibility_off;
  IconData _confirmEyeIcon = Icons.visibility_off;
  bool _isConfirmObscured = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _warningText = '';

  bool get _isPasswordValid {
    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(_passwordController.text);
    bool hasDigits = RegExp(r'\d').hasMatch(_passwordController.text);
    bool hasLowercase = RegExp(r'[a-z]').hasMatch(_passwordController.text);
    bool hasSpecialCharacters = RegExp(r'[!@#\$&*~]').hasMatch(_passwordController.text);
    bool hasMinLength = _passwordController.text.length >= 8;

    return hasUppercase && hasDigits && hasLowercase && hasSpecialCharacters && hasMinLength;
  }


  bool get _isConfirmPasswordValid => _passwordController.text == _confirmPasswordController.text;

  ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);


  void _validateAndNavigate() {
    if (_passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      setState(() => _warningText = "Please fill both fields.");
      isFormValid.value = false;

    } else if (!_isPasswordValid) {
      setState(() => _warningText = "Password must have at least 8 characters, 1 special character, and 1 number.");
       isFormValid.value = false;
       
    } else if (!_isConfirmPasswordValid) {
      setState(() => _warningText = "Passwords don't match.");
       isFormValid.value = false;

    } else {
      setState(() => _warningText = ""); 
      isFormValid.value = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) => Screen5()));
    }
  }

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
                Navigator.pop(context); // Go back to Screen2
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
                // Password field
                RichText(
                  text: TextSpan(
                    text: 'Password',
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
                // Text(
                //   'at least 8 characters',
                //   style: TextStyle(
                //     color: Colors.grey,
                //     fontSize: 16,
                //   ),
                // ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscured,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                    hintText: 'at least 8 characters',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    filled: true,
                    fillColor: Colors.white,
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
                      borderSide: BorderSide(color: Colors.black, width: 5.0), // Thick line
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5.0), // Thick line
                    ),
                  ),
                ),

                // SizedBox widget
                SizedBox(height: 30),

                // Confirm Password field
                RichText(
                  text: TextSpan(
                    text: 'Confirm Password',
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
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _isConfirmObscured,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(_confirmEyeIcon),
                      onPressed: () {
                        setState(() {
                          _isConfirmObscured = !_isConfirmObscured;
                          _confirmEyeIcon = _isConfirmObscured ? Icons.visibility_off : Icons.visibility;
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


                // SizedBox widget
                SizedBox(height: 50),

                // Sign up button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFA700)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 25),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: _validateAndNavigate,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (_warningText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      _warningText,
                      style: TextStyle(color: Colors.red),
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