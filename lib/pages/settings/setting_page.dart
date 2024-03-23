import 'package:ai_journey/models/user.dart';
import 'package:ai_journey/pages/helps/help.dart';
import 'package:ai_journey/pages/pages.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //         'path/to/your/image.jpg'), // Replace 'path/to/your/image.jpg' with the actual path to your image asset
          //     fit: BoxFit
          //         .cover, // You can adjust the BoxFit property according to your requirement
          //   ),
          // ),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    //margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 159, 234, 187),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        SizedBox(width: 100),
                        Center(
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfilePage(user: User.dummyUsers[0]),
                              ),
                            );
                          },
                          child: Center(
                            child: BuildUser(
                              imageAssetLink:
                                  'assets/images/temp_user_images/serhan.jpg',
                              username: 'Toan 1',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Container(
                            width: 40, // Adjust the width and height as needed
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape
                                  .circle, // Use BoxShape.circle to create a circular container
                              color: Colors.lightBlueAccent,
                            ),
                            child: const Center(
                              child: Icon(Icons.key_outlined,
                                  color: Colors
                                      .white), // Center the Icon within the circular Container
                            ),
                          ),
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Account'), // 'Account' text
                              Text('Privacy, security, change number'),
                            ],
                          ),
                          onTap: () {
                            // Xử lý khi người dùng nhấn vào mục Account
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Container(
                            width: 40, // Adjust the width and height as needed
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(
                              child: Icon(Icons.question_mark_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Help'), // 'Account' text
                              Text('Help center, contact us, privacy policy'),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Container(
                            width: 40, // Adjust the width and height as needed
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(
                              child: Icon(Icons.ad_units_outlined,
                                  color: Colors.white),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Advertisement'),
                              Text('Contact us, Contact advertisements'),
                            ],
                          ),
                          onTap: () {
                            // Xử lý khi người dùng nhấn vào mục Account
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Container(
                            width: 40, // Adjust the width and height as needed
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(
                              child: Icon(Icons.storage_outlined,
                                  color: Colors
                                      .white), // Center the Icon within the circular Container
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Storage and data'), // 'Account' text
                              Text('Network usage, storage usage'),
                            ],
                          ),
                          onTap: () {
                            // Xử lý khi người dùng nhấn vào mục Account
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          leading: Container(
                            width: 40, // Adjust the width and height as needed
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(
                              child: Icon(Icons.logout_outlined,
                                  color: Colors
                                      .white), // Center the Icon within the circular Container
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Log out'), // 'Account' text
                            ],
                          ),
                          onTap: () {
                            // Xử lý khi người dùng nhấn vào mục Account
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BuildAccout extends StatelessWidget {
  const BuildAccout({
    super.key,
    required this.imageAssetLink,
    required this.username,
  });

  final String imageAssetLink;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MessageScreen()),
          // );
        },
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: AssetImage(imageAssetLink),
            ),
          ),
        ),
      ),
      subtitle: Column(
        children: [
          const Text(
            'Toan Toan',
            style: TextStyle(
              color: Color.fromARGB(255, 88, 86, 86),
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            'Never give up 💪',
            style: TextStyle(
              color: Color.fromARGB(255, 88, 86, 86),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.qr_code),
        onPressed: () {
          // Xử lý sự kiện khi icon được nhấn
        },
        color: Color.fromARGB(255, 15, 15, 15), // Màu của icon
      ),
    );
  }
}

class BuildUser extends StatelessWidget {
  const BuildUser({
    super.key,
    required this.imageAssetLink,
    required this.username,
  });

  final String imageAssetLink;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MessageScreen()),
          // );
        },
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: AssetImage(imageAssetLink),
            ),
          ),
        ),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Toan Toan',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 88, 86, 86),
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            'Never give up 💪',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 88, 86, 86),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.qr_code),
        onPressed: () {
          // Xử lý sự kiện khi icon được nhấn
        },
        color: Color.fromARGB(255, 15, 15, 15), // Màu của icon
      ),
      // trailing: ElevatedButton(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Color.fromARGB(171, 255, 255, 255),
      //     shape: RoundedRectangleBorder(
      //       side: const BorderSide(
      //         color: Color.fromARGB(255, 8, 108, 10),
      //       ),
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      //   ),
      //   onPressed: () {},
      //   child: const Text(
      //     'Follow',
      //     style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
      //   ),
      // ),
    );
  }
}
