class Newspaper{
  final String image;
  final String title;
  final String content;
  Newspaper({
    required this.image,
    required this.title,
    required this.content,
  });
  factory Newspaper.fromJson(Map<String, dynamic> json) {
    return Newspaper(
      image: json['image'],
      title: json['title'],
      content: json['content'],
    );
  }
}