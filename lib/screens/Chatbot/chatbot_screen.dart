import 'package:flutter/material.dart';

class chatbot_screen extends StatefulWidget {
  static String routeName = "/chatbot_screen";
  const chatbot_screen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<chatbot_screen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add({'sender': 'user', 'message': message});
    });
    _handleDummyResponse();
    _controller.clear();
  }

  void _handleDummyResponse() {
    // Dummy bot response
    setState(() {
      _messages.add({'sender': 'bot', 'message': 'This is a dummy response.'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message['message']!),
                  // Align user messages to the righst
                  trailing: message['sender'] == 'user'
                      ? Icon(Icons.person)
                      : null,
                  // Align bot messages to the left
                  leading: message['sender'] == 'bot'
                      ? Icon(Icons.chat_bubble_outline)
                      : null,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: chatbot_screen(),
  ));
}
