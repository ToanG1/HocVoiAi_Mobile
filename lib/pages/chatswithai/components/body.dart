import 'package:ai_journey/widgets/layout/responsive_padding.dart';
import 'package:flutter/material.dart';

class ConversationChatAI1 extends StatefulWidget {
  const ConversationChatAI1({super.key});

  @override
  State<ConversationChatAI1> createState() => _ConversationChatAIState();
}

class _ConversationChatAIState extends State<ConversationChatAI1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Canh giữa các widget theo chiều dọc
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Icon(
                    Icons.expand,
                    color: Colors.black,
                  ),
                  Text(
                    'Extend',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "Explain Quantum physics",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "What are wormholes explain like i am 5",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.pending,
                    color: Colors.black,
                  ),
                  Text(
                    'Write & edit',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "Write a tweet about global warming",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "Write a poem about flower and love",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "Write a rap song lyrics about",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.translate,
                    color: Colors.black,
                  ),
                  const Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Text color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "How do you say “how are you” in korean?",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(218, 217, 217, 1)),
                ),
                child: Text(
                  "Write a poem about flower and love",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 159, 234, 187),
          ),
          height: 50,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Hello chatGPT,how are you today?',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(
                  Icons.send,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterBar extends StatelessWidget {
  const FooterBar({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final String chat;

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 159, 234, 187),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 243, 242, 242),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: 'Hello chatGPT,how are you today?',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(243, 242, 242, 0.5),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    flexibleSpace: ResponsivePadding(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // căn chỉnh các phần tử theo hai bên của hàng
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        SizedBox(width: 25), // Khoảng cách giữa icon và logo
                        Image.asset(
                          'assets/images/logo/logosocailAI.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 50),

                        const Text(
                          "Online",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6, right: 11),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF66D8B7),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        SizedBox(width: 70),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: Icon(
                            Icons.volume_up,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
