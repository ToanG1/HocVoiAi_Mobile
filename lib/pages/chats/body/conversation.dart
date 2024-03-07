import 'package:ai_journey/widgets/layout/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class ConversationChatFriend extends StatefulWidget {
  const ConversationChatFriend({super.key});

  @override
  State<ConversationChatFriend> createState() => _ConversationChatFriendState();
}

class _ConversationChatFriendState extends State<ConversationChatFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: new Drawer(),
      body: FooterView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Center(
              child: new SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ),
        ],
        footer: new Footer(
          child: Padding(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 159, 234, 187),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Align(
                alignment: Alignment.center,
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
            padding: const EdgeInsets.all(10),
          ),
        ),
        flex: 1,
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
                        SizedBox(width: 10), // Khoảng cách giữa icon và logo
                        Image.asset(
                          'assets/images/logo/logosocailAI.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 10),

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
                        SizedBox(width: 20),
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
