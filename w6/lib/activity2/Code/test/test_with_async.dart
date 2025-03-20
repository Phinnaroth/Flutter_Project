// ignore_for_file: avoid_print
import '../repository/mock_post_repository.dart';
import '../repository/post_repository.dart';

import '../model/post.dart';

void main() async {
  // 1- Create the repo
  PostRepository postRepo = MockPostRepository();

  // 2- Request the post  - Success
  try {
    print("Fetching post 25....");
    Post result = await postRepo.getPost(25);
    print("Post : title ${result.title} -  description  ${result.description}");
  } on Exception catch (e) {
    print("Error when getting post : $e");
  }

  // 3- Request the post  - Failed
  try {
    print("Fetching post 24....");
    Post result = await postRepo.getPost(24);
    print("Post : title ${result.title} -  description  ${result.description}");
  } on Exception catch (e) {
    print("Error when getting post : $e");
  }
}
