class Book {
  final int id;
  final String title;
  final String author;

  const Book({
    required this.id,
    required this.author,
    required this.title,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        author: json['author'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
      };
}
