// ignore_for_file: avoid_print

import 'package:w6/activity2/repository/mock_post_repository.dart';

import '../repository/post_repository.dart';

void main() async{
  // 1- Create the repo
  PostRepository mockPostRepository = MockPostRepository();
  // 2- Request the post  - Success
  try {
    var post = await mockPostRepository.getPost(25);
    print("Post: $post, Title: ${post.title}, Description: ${post.description}");
  } catch (e) {
    print("fail $e");
  }
  // 3- Request the post - Failed
  try {
    var post = await mockPostRepository.getPost(1);
    print("Post: $post, Title: ${post.title}, Description: ${post.description}");
  } catch (e) {
    print("fail $e");
  }
}
