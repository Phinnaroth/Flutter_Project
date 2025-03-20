import 'post_repository.dart';
import '../model/post.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) {
    return Future.delayed(Duration(seconds: 3), () {
      if (postId != 25) {
        throw Exception("No post found");
      }
      return Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      );
    });
  }
}
