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
  String? avatarUrl;

  Comments({this.id, this.userName, this.comment, this.time, this.avatarUrl});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    comment = json['comment'];
    time = json['time'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['comment'] = this.comment;
    data['time'] = this.time;
    data['avatarUrl'] = this.avatarUrl;
    return data;
  }
}