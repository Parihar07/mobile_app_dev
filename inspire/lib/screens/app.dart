import 'package:flutter/material.dart';
import 'package:inspire/models/quote.dart';
import 'dart:math';

class Inspire extends StatefulWidget {
  const Inspire({super.key});

  @override
  State<Inspire> createState() => _InspireState();
}

class _InspireState extends State<Inspire> {
  late Quote currentQuote;

  @override
  void initState() {
    super.initState();
    // Show first quote when app starts
    currentQuote = quotes[0];
  }

  void getRandomQuote() {
    setState(() {
      // Generate random index and get quote
      int randomIndex = Random().nextInt(quotes.length);
      currentQuote = quotes[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text(
          "Inspiration for today",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[300],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Quote text
              Text(
                currentQuote.text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Author name
              Text(
                "- ${currentQuote.author}",
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 125, 123, 123),
                ),
              ),
              const SizedBox(height: 40),
              // Button
              ElevatedButton(
                onPressed: getRandomQuote,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  "Get Inspiration",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
