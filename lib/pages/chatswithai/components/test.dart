// import 'dart:math';
// import 'package:gap/gap.dart';

// import 'package:flutter/material.dart';
// import './../../../models/user_chat_ai.dart';
// import 'package:uuid/uuid.dart';
// import './message_card.dart';
// import './../../../main.dart';

// class ChatWithAIScreen extends StatefulWidget {
//   const ChatWithAIScreen({super.key});

//   @override
//   State<ChatWithAIScreen> createState() => _ChatWithAIScreenState();
// }

// class _ChatWithAIScreenState extends State<ChatWithAIScreen> {
//   TextEditingController controller = TextEditingController();
//   List<MessageAI> messages = [];

//   @override
//   void initState() {
//     _startWebSocket();

//     chatRepository.subscribeToMessageUpdates((message) {
//       // Update an existing message
//       if (message['event'] == 'message.updated') {
//         final updatedMessage = MessageAI.fromJson(message['data']);
//         setState(() {
//           messages = messages.map((message) {
//             if (message.id == updatedMessage.id) {
//               return updatedMessage;
//             }
//             return message;
//           }).toList();
//         });
//         return;
//       }

//       // New message
//       final newMessage = MessageAI.fromJson(message['data']);
//       setState(() {
//         messages.add(newMessage);
//       });
//     });
//     super.initState();
//   }

//   _startWebSocket() {
//     webSocketClient.connect(
//       'ws://localhost:8080/ws',
//       {
//         'Authorization': 'Bearer ...',
//       },
//     );
//   }

//   Future<void> _createMessage(MessageAI message) async {
//     await chatRepository.createMessage(message);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 159, 234, 187),
//         scrolledUnderElevation: 0,
//         toolbarHeight: 100.0,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(30.0),
//           ),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage('https://picsum.photos/200'),
//                   radius: 25,
//                 ),
//                 SizedBox(width: 10), // Use SizedBox for spacing
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       // people.name,
//                       'Ninh',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     getOnlineOrOffline()
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10), // Add spacing between the rows
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.videocam),
//                   onPressed: () {},
//                 ),
//                 //const SizedBox(width: 25),
//                 IconButton(
//                   icon: const Icon(Icons.phone),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // appBar: AppBar(
//       //   backgroundColor: Colors.transparent,
//       //   title: RichText(
//       //     text: TextSpan(
//       //       text: 'Build with ',
//       //       style: textTheme.titleLarge,
//       //       children: [
//       //         TextSpan(
//       //           text: 'Gemini',
//       //           style: textTheme.titleLarge!.copyWith(
//       //             fontWeight: FontWeight.bold,
//       //             color: Colors.black,
//       //           ),
//       //         )
//       //       ],
//       //     ),
//       //   )
//       //       .animate(
//       //         onComplete: (controller) => controller.repeat(),
//       //       )
//       //       .shimmer(
//       //         duration: const Duration(milliseconds: 2000),
//       //         delay: const Duration(milliseconds: 1000),
//       //       ),
//       // ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(8.0),
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           final message = messages[index];
//           return MessageAICard(message: message);
//         },
//       ),
//       floatingActionButton: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: TextFormField(
//                 controller: controller,
//                 autofocus: true,
//                 decoration: InputDecoration(
//                   hintText: 'Input text',
//                   filled: true,
//                   isDense: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onFieldSubmitted: (text) {
//                   if (text.isNotEmpty) {
//                     controller.clear();
//                   }
//                 },
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.picture_in_picture_outlined),
//             ),
//             IconButton(
//               onPressed: () {
//                 final message = MessageAI(
//                   id: const Uuid().v4(),
//                   content: controller.text,
//                   //sourceType: MessageSourceType.user,
//                   createdAt: DateTime.now(),
//                 );

//                 setState(() {
//                   messages.add(message);
//                 });

//                 _createMessage(message);
//                 controller.clear();
//               },
//               icon: const Icon(Icons.send),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget getOnlineOrOffline() {
//   int rand = Random().nextInt(2) + 1;
//   switch (rand) {
//     case 1:
//       {
//         return const Text(
//           "Online",
//           style: TextStyle(
//             fontSize: 16,
//             color: Color.fromARGB(255, 58, 158, 62),
//           ),
//         );
//       }
//     default:
//       {
//         return const Text(
//           "Offline",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.red,
//           ),
//         );
//       }
//   }
// }



// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'dart:math';
// // import 'package:ai_journey/config/http_client.dart';
// // import 'package:socket_io_client/socket_io_client.dart' as IO;
// // import './../../../models/user_chat.dart';
// // import 'package:uuid/uuid.dart';

// // class MessageScreen extends StatefulWidget {
// //   const MessageScreen({super.key});
// //   Future<void> showMessage(BuildContext context) async {
// //     await showModalBottomSheet(
// //       context: context,
// //       useSafeArea: true,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //       ),
// //       enableDrag: true,
// //       isScrollControlled: true,
// //       builder: (_) {
// //         return Container(
// //           // Your bottom sheet content here
// //           child: SendMessage(),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   State<MessageScreen> createState() => _MessageScreenState();
// // }

// // class SendMessage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       // Your bottom sheet content here
// //       child: Text('Your bottom sheet content'),
// //     );
// //   }
// // }

// // Widget _commentTextField(BuildContext context, ThemeData theme) {
// //   TextEditingController controller = TextEditingController();
// //   return Container(
// //     color: theme.colorScheme.secondaryContainer,
// //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //     margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// //     child: Row(
// //       children: [
// //         Flexible(
// //           child: TextField(
// //             controller: controller,
// //             autofocus: true,
// //             decoration: InputDecoration(
// //               // hintText: 'Tulis sesuatu',
// //               filled: true,
// //               isDense: true,
// //               fillColor: theme.colorScheme.background,
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //                 borderSide: BorderSide.none,
// //               ),
// //             ),
// //             onSubmitted: (text) {
// //               if (text.isNotEmpty) {
// //                 _submitComment(context, text);
// //                 controller.clear();
// //               }
// //             },
// //           ),
// //         ),
// //         const SizedBox(width: 4),
// //         IconButton(
// //           onPressed: () {
// //             if (controller.text.isNotEmpty) {
// //               _submitComment(context, controller.text);
// //               controller.clear();
// //             }
// //           },
// //           icon: const Icon(Icons.send),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // void _submitComment(BuildContext context, String text) {
// //   // setState(() {
// //   //   _comments.add(
// //   //     Comment(
// //   //       owner: User.dummyUsers[0],
// //   //       body: text,
// //   //       likeCount: 0,
// //   //     ),
// //   //   );
// //   // });
// // }

// // class _MessageScreenState extends State<MessageScreen> {
// //   var messageController = TextEditingController();
// //   final httpService = HttpService(url);

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   sendMessage(_, index, func) {}

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         scrolledUnderElevation: 0,
// //         toolbarHeight: 100.0,
// //         shape: const RoundedRectangleBorder(
// //           borderRadius: BorderRadius.vertical(
// //             bottom: Radius.circular(30.0),
// //           ),
// //         ),
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Row(
// //               children: [
// //                 CircleAvatar(
// //                   backgroundImage: NetworkImage('https://picsum.photos/200'),
// //                   radius: 25,
// //                 ),
// //                 const Gap(10),
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       // people.name,
// //                       'Ninh',
// //                       style: const TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     getOnlineOrOffline()
// //                   ],
// //                 ),
// //               ],
// //             ),
// //             const Row(
// //               children: [
// //                 Icon(Icons.videocam),
// //                 Gap(25),
// //                 Icon(Icons.phone),
// //               ],
// //             ),
// //           ],
// //         ),
// //         backgroundColor: Colors.white,
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         decoration: const BoxDecoration(
// //           color: Color.fromARGB(255, 241, 241, 241),
// //         ),
// //         child: Container(
// //           width: double.infinity,
// //           margin: const EdgeInsets.only(top: 140),
// //           child: Column(
// //             children: [
              
// //               Container(
// //                 width: double.infinity,
// //                 height: 120,
// //                 decoration: const BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(30),
// //                     topRight: Radius.circular(30),
// //                   ),
// //                 ),
// //                 child: Container(
// //                   margin: const EdgeInsets.all(30),
// //                   decoration: BoxDecoration(
// //                     color: const Color.fromARGB(255, 241, 241, 241),
// //                     borderRadius: BorderRadius.circular(30),
// //                   ),
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 15,
// //                       horizontal: 25,
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         Expanded(
// //                           child: TextField(
// //                             controller: messageController,
// //                             decoration: InputDecoration.collapsed(
// //                               hintText: 'Nhập tin nhắn...',
// //                               hintStyle: TextStyle(
// //                                 fontSize: 17,
// //                                 color: Colors.black.withOpacity(0.5),
// //                               ),
// //                             ),
// //                             keyboardType: TextInputType
// //                                 .text, // Set keyboard type to accept text input
// //                           ),
// //                         ),
// //                         VerticalDivider(color: Colors.black.withOpacity(0.2)),
// //                         const Gap(15),
// //                         Row(
// //                           children: [
// //                             Icon(
// //                               Icons.picture_as_pdf_outlined,
// //                               size: 25,
// //                               color: Colors.black.withOpacity(0.5),
// //                             ),
// //                             const Gap(10),
// //                             IconButton(
// //                               icon: Icon(
// //                                 Icons.send,
// //                                 color: Colors.black,
// //                               ),
// //                               onPressed: () async {
// //                                 final theme = Theme.of(context);
// //                                 if (messageController.text.isNotEmpty) {
// //                                   messageController.clear();
// //                                 }
// //                               },
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget getOnlineOrOffline() {
// //     int rand = Random().nextInt(2) + 1;
// //     switch (rand) {
// //       case 1:
// //         {
// //           return const Text(
// //             "Online",
// //             style: TextStyle(
// //               fontSize: 16,
// //               color: Color.fromARGB(255, 58, 158, 62),
// //             ),
// //           );
// //         }
// //       default:
// //         {
// //           return const Text(
// //             "Offline",
// //             style: TextStyle(
// //               fontSize: 16,
// //               color: Colors.red,
// //             ),
// //           );
// //         }
// //     }
// //   }
// // }
