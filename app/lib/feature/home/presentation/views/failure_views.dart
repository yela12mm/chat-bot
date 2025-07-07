import 'package:flutter/material.dart';

Scaffold failure() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(199, 255, 169, 226),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://i.imgur.com/asEkZif.png",
              height: 250,
            ),
            
            const SizedBox(height: 20),
            const Text(
              "𝙏𝙧𝙮 𝙖𝙜𝙖𝙞𝙣 𝙡𝙖𝙩𝙚𝙧",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(251, 248, 251, 252),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
