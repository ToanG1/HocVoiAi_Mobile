import 'package:ai_journey/pages/post/createPost.dart';
import 'package:flutter/material.dart';
import 'package:ai_journey/models/models.dart';
import 'package:ai_journey/widgets/widgets.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _appBar(context, theme),
      body: ResponsivePadding(
        child: ListView(
          children: [
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: UserStory.dummyUserStories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 4 : 0,
                      right: index == UserStory.dummyUserStories.length - 1
                          ? 4
                          : 0,
                    ),
                    child: UserStoryTile(index: index),
                  );
                },
              ),
            ),
            ListView.separated(
              itemCount: Post.dummyPosts.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 4),
              ),
              itemBuilder: (context, index) {
                return PostCard(post: Post.dummyPosts[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, ThemeData theme) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: ResponsivePadding(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogo(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePost()),
                    );
                  },
                  icon: Icon(
                    Icons.post_add,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
