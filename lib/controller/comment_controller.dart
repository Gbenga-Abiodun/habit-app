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
    // isLoaded.value = true;
    Response response = await commentRepository.getCommentList();
    if (response.statusCode == 200) {

      //Todo: change to true
      isLoading.value = false;
      print(response.body);
      print("Gotten the request!");
      _commentList = [];
      _commentList.addAll(
        CommentModel.fromJson(response.body).comments,
      );


      print(_commentList);
    } else {
      print("could not get the request");
    }
  }
}
