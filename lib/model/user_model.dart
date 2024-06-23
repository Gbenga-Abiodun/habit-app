import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String id;
  final String email;
  final String profilePhoto;
  final int totalWorkHours;
  final int taskCompleted;

  UserModel(
      {required this.userName,
      required this.id,
      required this.email,
      required this.profilePhoto,
      required this.totalWorkHours,
      required this.taskCompleted});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map["userName"],
      id: map["id"],
      email: map["email"],
      // phoneNumber: map["phoneNumber"],
      profilePhoto: map["profilePicture"],
      totalWorkHours: map["totalWorkHours"],
      taskCompleted: map["taskCompleted"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userName": userName,
      "email": email,
      "id": id,
      "totalWorkHours": totalWorkHours,
      "profilePhoto": profilePhoto,
      "taskCompleted": taskCompleted,
    };
  }

  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      userName: snapshot["userName"],
      id: snapshot["id"],
      email: snapshot["email"],
      profilePhoto: snapshot["profilePhoto"],
      totalWorkHours: snapshot["totalWorkHours"],
      taskCompleted: snapshot["taskCompleted"],
    );
  }
}
