class Comment {
  final String userName;
  final String text;
  final String image;
  final String id;

  Comment({
    required this.userName,
    required this.text,
    required this.image,
    required this.id
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      image: json['image'],
      userName: json['userName'],
      text: json['text'],
      id: json['id'],
    );
  }
}
