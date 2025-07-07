import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  const Failure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn4.iconfinder.com/data/icons/programming-solid-style/24/android-alert-512.png',
            ),
          ),
        ),
      ));
  }
}