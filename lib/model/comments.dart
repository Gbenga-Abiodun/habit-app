class CommentModel {
  String? _message;
  late List<Comments> _comments;

  List<Comments> get comments => _comments;

  CommentModel({required message, required comments}){
    this._comments = comments;
    this._message = message;
  }

  CommentModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    if (json['comments'] != null) {
      _comments = <Comments>[];
      json['comments'].forEach((v) {
        _comments!.add(new Comments.fromJson(v));
      });
    }
  }

}

class Comments {
  int? id;
  String? userName;
  String? comment;
  String? time;

  Comments({this.id, this.userName, this.comment, this.time});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    comment = json['comment'];
    time = json['time'];
  }

}