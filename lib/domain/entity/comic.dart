/// Business model class of single comic
class Comic {
  int id;
  String title;
  String imageUrl;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Comic({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  Comic copyWith({
    int? id,
    String? title,
    String? imageUrl,
  }) {
    return new Comic(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Comic{id: $id, title: $title, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Comic && runtimeType == other.runtimeType && id == other.id && title == other.title && imageUrl == other.imageUrl);

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ imageUrl.hashCode;

  factory Comic.fromMap(Map<String, dynamic> map) {
    return new Comic(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'imageUrl': this.imageUrl,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
