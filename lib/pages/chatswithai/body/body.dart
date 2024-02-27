import 'package:flutter/material.dart';

class ChatWithAI extends StatefulWidget {
  const ChatWithAI({super.key});

  @override
  State<ChatWithAI> createState() => _ChatWithAIState();
}

class _ChatWithAIState extends State<ChatWithAI> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 159, 234, 187),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      // method to show the search bar
                      showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegateWithDummyData(),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Chat',
                      style: TextStyle(
                          color: Color.fromARGB(255, 243, 242, 242),
                          fontSize: 19),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildFollowableUser extends StatelessWidget {
  const BuildFollowableUser({
    super.key,
    required this.imageAssetLink,
    required this.username,
    required this.name,
  });

  final String imageAssetLink;
  final String username;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        onPressed: () {},
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
      subtitle: const Text(
        'Toan Toan',
        style: TextStyle(
            color: Color.fromARGB(255, 88, 86, 86),
            fontWeight: FontWeight.normal),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(171, 255, 255, 255),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 8, 108, 10),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Follow',
          style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
        ),
      ),
    );
  }
}

class CustomSearchDelegateWithDummyData extends SearchDelegate {
// Demo list to show querying
  List<BuildFollowableUser> searchTerms = [
    // const BuildFollowableUser(
    //   imageAssetLink: 'assets/images/temp_user_images/serhan.jpg',
    //   username: 'Toan 1',
    //   name: 'Toan',
    // ),
    // const BuildFollowableUser(
    //   imageAssetLink: 'assets/images/temp_user_images/sinan.jpg',
    //   username: 'Toan 2',
    //   name: 'Toan Toan',
    // ),
    // const BuildFollowableUser(
    //   imageAssetLink: 'assets/images/temp_user_images/musa.jpg',
    //   username: 'Toan 3',
    //   name: 'Ninh',
    // ),
    // const BuildFollowableUser(
    //   imageAssetLink: 'assets/images/temp_user_images/yusuf.jpg',
    //   username: 'Toan 4',
    //   name: 'Ninh Ninh Ninh',
    // ),
    // const BuildFollowableUser(
    //   imageAssetLink: 'assets/images/temp_user_images/onur.jpg',
    //   username: 'Toan 5',
    //   name: 'Ninh Ninh',
    // ),
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.username.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit.username);
      }
    }
    return Container(
      color: Colors.black, //
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            focusColor: Colors.black,
            title: Text(result),
          );
        },
      ),
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<BuildFollowableUser> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.username.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return result;
        },
      ),
    );
  }
}
