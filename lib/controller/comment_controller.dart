import 'package:get/get.dart';
import 'package:habit_app/data/repo/comment_repository.dart';
import 'package:habit_app/model/comments.dart';

class CommentController extends GetxController {
  final CommentRepository commentRepository;

  CommentController({required this.commentRepository});

  List<dynamic> _commentList = [];
  // creating a getter for the comment list
  List<dynamic> get commentList => _commentList;

  var isLoading = true.obs;

  Future<void> getComments() async {
    isLoading.value = true;
    Response response = await commentRepository.getCommentList();
    if (response.statusCode == 200) {
      print(response.body);
      print("Gotten the request!");
      _commentList = [];
      _commentList.addAll(
        CommentModel.fromJson(response.body).comments,
      );
      isLoading.value = false;

      print(_commentList);
    } else {
      isLoading.value = false;
      print("could not get the request");
    }
  }
}
