import 'package:w6/activity2/model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int id) {
    return Future.delayed(Duration(seconds: 3), () {
      return id == 25 ? Post(
        id: 25,
        title: 'Who is the best',
        description: 'Teacher ronan',
      ) : throw Exception('No post found');
    });
  }
}
// TODO