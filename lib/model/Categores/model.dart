class Categores {
  String id;
  String code;
  String name;
  String parent;
  String slug;
  String dateAdded;
  String lastModified;
  FontAwesomeClass fontAwesomeClass;
  String thumbnail;
  String order;
  int numberOfCourses;

  Categores({
    required this.id,
    required this.code,
    required this.name,
    required this.parent,
    required this.slug,
    required this.dateAdded,
    required this.lastModified,
    required this.fontAwesomeClass,
    required this.thumbnail,
    required this.order,
    required this.numberOfCourses,
  });

  factory Categores.fromJson(Map<String, dynamic> json) {
    return Categores(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      parent: json['parent'] ?? '',
      slug: json['slug'] ?? '',
      dateAdded: json['date_added'] ?? '',
      lastModified: json['last_modified'] ?? '',
      fontAwesomeClass: _parseFontAwesomeClass(json['font_awesome_class']),
      thumbnail: json['thumbnail'] ?? '',
      order: json['order'] ?? '',
      numberOfCourses: json['number_of_courses'] ?? 0,
    );
  }

  static FontAwesomeClass _parseFontAwesomeClass(String value) {
    switch (value) {
      case 'FAS_FA_CHESS':
        return FontAwesomeClass.FAS_FA_CHESS;
      default:
        return FontAwesomeClass
            .FAS_FA_CHESS; // Default value, change it accordingly
    }
  }
}

enum FontAwesomeClass { FAS_FA_CHESS }
