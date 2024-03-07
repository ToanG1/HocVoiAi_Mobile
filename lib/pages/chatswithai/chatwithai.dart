import 'package:ai_journey/pages/chats/chat.dart';
import 'package:ai_journey/pages/chatswithai/components/body.dart';
import 'package:flutter/material.dart';

class ChatWithAIScreen extends StatelessWidget {
  const ChatWithAIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black, // Màu của icon
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
          backgroundColor:
              Colors.transparent, // Đặt màu nền của AppBar là trong suốt
          elevation: 0, // Ẩn hiệu ứng đổ bóng của AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You AI Assistant',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF086C0A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Using this software, you can ask me\nquestions and receive articles using\nartificial intelligence assistant',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Image.asset(
                'assets/images/logo/logosocailAI.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.popUntil(context, ModalRoute.withName('/'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConversationChatAI1(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Khoảng cách giữa icon và văn bản
                      Text(
                        'Continue'.toUpperCase(),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.black),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
