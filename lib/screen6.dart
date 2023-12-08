import 'package:flutter/material.dart';

class MatchedScreen extends StatefulWidget {
  final String matchedUserProfileImage; // This parameter will store the image path

  MatchedScreen({required this.matchedUserProfileImage});

  @override
  _MatchedScreenState createState() => _MatchedScreenState();
  
}

class _MatchedScreenState extends State<MatchedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(color: Colors.orange),
          
          // Close button
          Positioned(
            top: 10.0,
            right: 10.0,
            child: IconButton(
              icon: Icon(Icons.close, size: 30.0, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Navigates back to previous screen
              },
            ),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(widget.matchedUserProfileImage), // Replace with NetworkImage if using URLs
                ),
                SizedBox(height: 20.0),
                Text("You've made a new friend!", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to message screen or trigger message modal
                  },
                  child: Text("Send {username} a message"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
