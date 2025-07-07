import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 33, 198),
          title: const Text('𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒 '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "𝙱𝚒𝚎𝚗𝚟𝚎𝚗𝚒𝚍𝚘 𝚊 𝙲𝚑𝚊𝚝 𝙼𝚘𝚕𝚒",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Image.network(
                "https://i.imgur.com/Mzu5wye.png",
                height: 250,
              ),
              ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 243, 33, 198)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
            },
            child: Text('Ingresar '),
              )
            ],
          ),
        ),
      ),
    );
  }
}