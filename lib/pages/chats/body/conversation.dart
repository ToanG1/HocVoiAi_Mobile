import 'dart:math';
import 'package:gap/gap.dart';

import 'package:flutter/material.dart';
import './../../../models/user_chat.dart';
import 'package:uuid/uuid.dart';
import './components/message_card.dart';
import './../../../main.dart';

class ChatUserScreen extends StatefulWidget {
  const ChatUserScreen({super.key});

  @override
  State<ChatUserScreen> createState() => _ChatUserScreenState();
}

class _ChatUserScreenState extends State<ChatUserScreen> {
  TextEditingController controller = TextEditingController();
  List<Message> messages = [];

  @override
  void initState() {
    _startWebSocket();

    chatRepository.subscribeToMessageUpdates((message) {
      // Update an existing message
      if (message['event'] == 'message.updated') {
        final updatedMessage = Message.fromJson(message['data']);
        setState(() {
          messages = messages.map((message) {
            if (message.id == updatedMessage.id) {
              return updatedMessage;
            }
            return message;
          }).toList();
        });
        return;
      }

      // New message
      final newMessage = Message.fromJson(message['data']);
      setState(() {
        messages.add(newMessage);
      });
    });
    super.initState();
  }

  _startWebSocket() {
    webSocketClient.connect(
      'ws://localhost:8080/ws',
      {
        'Authorization': 'Bearer ...',
      },
    );
  }

  Future<void> _createMessage(Message message) async {
    await chatRepository.createMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 234, 187),
        scrolledUnderElevation: 0,
        toolbarHeight: 100.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                  radius: 25,
                ),
                SizedBox(width: 10), // Use SizedBox for spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // people.name,
                      'Ninh',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    getOnlineOrOffline()
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // Add spacing between the rows
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.videocam),
                  onPressed: () {},
                ),
                //const SizedBox(width: 25),
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: RichText(
      //     text: TextSpan(
      //       text: 'Build with ',
      //       style: textTheme.titleLarge,
      //       children: [
      //         TextSpan(
      //           text: 'Gemini',
      //           style: textTheme.titleLarge!.copyWith(
      //             fontWeight: FontWeight.bold,
      //             color: Colors.black,
      //           ),
      //         )
      //       ],
      //     ),
      //   )
      //       .animate(
      //         onComplete: (controller) => controller.repeat(),
      //       )
      //       .shimmer(
      //         duration: const Duration(milliseconds: 2000),
      //         delay: const Duration(milliseconds: 1000),
      //       ),
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessageCard(message: message);
        },
      ),
      floatingActionButton: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Input text',
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                onFieldSubmitted: (text) {
                  if (text.isNotEmpty) {
                    controller.clear();
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.picture_in_picture_outlined),
            ),
            IconButton(
              onPressed: () {
                final message = Message(
                  id: const Uuid().v4(),
                  content: controller.text,
                  sourceType: MessageSourceType.user,
                  createdAt: DateTime.now(),
                );

                setState(() {
                  messages.add(message);
                });

                _createMessage(message);
                controller.clear();
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getOnlineOrOffline() {
  int rand = Random().nextInt(2) + 1;
  switch (rand) {
    case 1:
      {
        return const Text(
          "Online",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 58, 158, 62),
          ),
        );
      }
    default:
      {
        return const Text(
          "Offline",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        );
      }
  }
}
