import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController partnerNameController = TextEditingController();
  bool _isLoading = false;

  Future<void> _calculateLovePercentage(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Simulate a delay for loading
      await Future.delayed(Duration(seconds: 8));

      final name = nameController.text.toLowerCase();
      final partnerName = partnerNameController.text.toLowerCase();
      bool first = name.isEmpty;
      bool second = name.isEmpty;

      bool containsHannan = name.contains('hannan');
      bool containsWafa = partnerName.contains('wafa');
      bool coint = name.contains('wafa');
      bool a2 = partnerName.contains('hannan');
      bool bunny = name.contains('bunny');
      bool bhalu = partnerName.contains('bhalu');
      bool bunny1 = name.contains('bhalu');
      bool bhalu1 = partnerName.contains('bunny');

      int percentage = 0;

      if ((containsHannan && containsWafa) ||
          (coint && a2) ||
          (bunny && bhalu) ||
          (bunny1 && bhalu1)) {
        percentage = 100;
      } else {
        percentage = ((name.length * partnerName.length) % 100) + 1;
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      Navigator.pushNamed(context, '/result', arguments: percentage);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      // Handle the exception (show a message to the user, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                Image.asset('assets/couple.png', height: 200),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: partnerNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Partner Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red, size: 40),
                      onPressed: () => _calculateLovePercentage(context),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.white, size: 40),
                      onPressed: () {
                        nameController.clear();
                        partnerNameController.clear();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_isLoading)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black
                      .withOpacity(0.3), // Dark overlay for better visibility
                ),
              ),
            ),
          if (_isLoading)
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text(
                      'Calculating...',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
