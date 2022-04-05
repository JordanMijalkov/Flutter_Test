class Book {
  final String bookId;
  final String? name;
  final String? author;
  final String? image;

  Book({
    required this.bookId,
    this.name,
    this.author,
    this.image,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json["bookId"].toString(),
      name: json["name"],
      author: json["author"],
      image: json["image"],
    );
  }
}
