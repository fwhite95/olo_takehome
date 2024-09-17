class Note {
  final String title;
  final String body;
  final DateTime lastModified;

  const Note({
    required this.title,
    required this.body,
    required this.lastModified,
  });

  Note copyWith({
    String? title,
    String? body,
    DateTime? lastModified,
  }) {
    return Note(
      title: title ?? this.title,
      body: body ?? this.body,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      lastModified: DateTime.parse(json['lastModified']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'lastModified': lastModified,
    };
  }

  @override
  String toString() {
    return 'title: $title, body: $body, lastModified: $lastModified';
  }
}
