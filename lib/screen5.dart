import 'package:driplit/screen6.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class Screen5 extends StatefulWidget {
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  List<String> memeImages = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    //... add more images if necessary
  ];
  List<int> likedMemes = [];

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController = SwipeableCardSectionController();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 50),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(  
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [              
              Divider(thickness: 7, color: Colors.black),
              SizedBox(height: 70.0), 
              Flexible(
                child: Center(
                  child: Container(
                    height: 400, 
                    child: SwipeableCardsSection(
                      cardController: _cardController,
                      context: context,
                      items: memeImages.map((image) => Image.asset(image, fit: BoxFit.contain)).toList(),
                      onCardSwiped: (dir, index, widget) {
                        if (dir == Direction.right) {
                          likedMemes.add(index);
                          if (likedMemes.length == 2) {
                            // Check if both memes have been liked by both users
                            // If true, navigate to MatchedScreen
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Screen6(matchedUserProfileImage: 'path_to_image')));
                            likedMemes.clear();
                          }
                        }
                      },
                      enableSwipeUp: false,
                      enableSwipeDown: false,
                    ),
                  ),
                ),
              ),
              // ... Rest of the code remains unchanged
            ],
          ),
        ],
      ),
    );
  }

  void _checkForMatch() {
    if (likedMemes.contains(0) && likedMemes.contains(1)) { // This is just a sample logic for matching
      Navigator.of(context).pushNamed('/screen6');  // Assuming you've defined '/screen6' route for MatchedScreen in your main.dart
    }
  }
}
