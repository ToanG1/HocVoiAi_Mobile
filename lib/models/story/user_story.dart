import 'package:quick_social/models/models.dart';
// dữ liệu dùng faker test ngẫu nhiên

class UserStory {
  final User owner;
  final List<Story> stories;

  const UserStory({
    required this.owner,
    required this.stories,
  });

  static List<UserStory> dummyUserStories = List.generate(
    User.dummyUsers.length,
    (index) {
      return UserStory(
        owner: User.dummyUsers[index],
        stories: Story.generateDummyStories(),
      );
    },
  );
}
