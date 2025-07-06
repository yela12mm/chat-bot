import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat IA - OpenRouter',
      theme: ThemeData(dialogBackgroundColor:Color.fromARGB(255, 196, 253, 253)),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
    });

    final url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer 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', 
        'Content-Type': 'application/json',
        'HTTP-Referer': 'https://github.com/yela12mm/chat-bot', 
        'X-Title': 'MiAppDeChatIA'
      },
      body: jsonEncode({
        "model": "mistralai/mistral-7b-instruct",
        "messages": [
          {"role": "system", "content": "Responde como un asistente útil."},
          {"role": "user", "content": userMessage}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final reply = data['choices'][0]['message']['content'];

      setState(() {
        _messages.add({'role': 'assistant', 'content': reply});
      });
    } else {
      print('Error: ${response.body}');
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': '❌ Error al responder (${response.statusCode})'
        });
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 249),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 177, 236, 248) ,title:Text('Chat IA - OpenRouter')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isUser ? const Color.fromARGB(255, 229, 250, 253) : const Color.fromARGB(255, 203, 241, 241),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message['content'] ?? ''),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        InputDecoration(hintText: 'Escribe tu mensaje...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) sendMessage(text);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}