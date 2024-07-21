import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    String romanticText;
    if (result == 100) {
      romanticText = 'Perfect Match!';
    } else if (result >= 80 && result < 100) {
      romanticText = 'You Guys Can make it!';
    } else if (result >= 60 && result < 80) {
      romanticText = 'You Should Talk to Each Other!';
    } else if (result >= 50 && result < 60) {
      romanticText = 'Not a Couple!';
    } else {
      romanticText = 'Try Again!';
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Result',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              romanticText,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$result%',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/couple.png', height: 200), // Updated path
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Recalculate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
