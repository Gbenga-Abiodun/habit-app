import 'package:get/get_connect.dart';
import 'package:habit_app/constants/app_constants.dart';
import 'package:habit_app/data/api/api_client.dart';

class CommentRepository {
  final ApiClient apiClient;

  CommentRepository({required this.apiClient});

  Future<Response> getCommentList() async {
    return await apiClient.getData(
      AppConstants.commentUrl,
    );
  }
}
