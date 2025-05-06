class UserModel {
  final String userName;
  final int score;
  final String? img;
  final bool? reminderConfig;

  UserModel({
    required this.userName,
    required this.score,
    this.img,
    this.reminderConfig,
  });

  // Ánh xạ từ Map (Firestore) thành User
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] ?? 'Unknown',
      score: json['score'] ?? 0,
      img: json['img'],
      reminderConfig: json['reminderConfig'] ,
    );
  }

  // Chuyển User thành Map (nếu cần lưu dữ liệu lên Firestore)
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'score': score,
      'avatar': img,

    };
  }
}