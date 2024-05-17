class TopCourses {
  final String id;
  final String title;
  final String shortDescription;
  final String description;
  final List<String> outcomes;
  final Language language;
  final String categoryId;
  final String subCategoryId;
  final String section;
  final List<dynamic> requirements;
  final String price;
  final String? discountFlag;
  final String discountedPrice;
  final Level level;
  final String userId;
  final String thumbnail;
  final String videoUrl;
  final String dateAdded;
  final String lastModified;
  final dynamic visibility;
  final String isTopCourse;
  final String isAdmin;
  final Status status;
  final CourseOverviewProvider courseOverviewProvider;
  final String metaKeywords;
  final String metaDescription;
  final dynamic isFreeCourse;
  final String topCoureExternal;
  final String externalLink;
  final int rating;
  final int numberOfRatings;
  final InstructorName instructorName;
  final int totalEnrollment;
  final String shareableLink;
  final String fullPrice;
  final String videoCount;

  TopCourses({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.outcomes,
    required this.language,
    required this.categoryId,
    required this.subCategoryId,
    required this.section,
    required this.requirements,
    required this.price,
    required this.discountFlag,
    required this.discountedPrice,
    required this.level,
    required this.userId,
    required this.thumbnail,
    required this.videoUrl,
    required this.dateAdded,
    required this.lastModified,
    required this.visibility,
    required this.isTopCourse,
    required this.isAdmin,
    required this.status,
    required this.courseOverviewProvider,
    required this.metaKeywords,
    required this.metaDescription,
    required this.isFreeCourse,
    required this.topCoureExternal,
    required this.externalLink,
    required this.rating,
    required this.numberOfRatings,
    required this.instructorName,
    required this.totalEnrollment,
    required this.shareableLink,
    required this.fullPrice,
    required this.videoCount,
  });

  factory TopCourses.fromJson(Map<String, dynamic> json) {
    return TopCourses(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      shortDescription: json['short_description'] ?? '',
      description: json['description'] ?? '',
      outcomes: List<String>.from(json['outcomes'] ?? []),
      language: Language.values.firstWhere(
          (lang) => lang.toString().split('.').last == json['language'],
          orElse: () => Language.ENGLISH),
      categoryId: json['category_id'] ?? '',
      subCategoryId: json['sub_category_id'] ?? '',
      section: json['section'] ?? '',
      requirements: List<dynamic>.from(json['requirements'] ?? []),
      price: json['price'] ?? '',
      discountFlag: json['discount_flag'],
      discountedPrice: json['discounted_price'] ?? '',
      level: Level.values.firstWhere(
          (lvl) => lvl.toString().split('.').last == json['level'],
          orElse: () => Level.BEGINNER),
      userId: json['user_id'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      videoUrl: json['video_url'] ?? '',
      dateAdded: json['date_added'] ?? '',
      lastModified: json['last_modified'] ?? '',
      visibility: json['visibility'],
      isTopCourse: json['is_top_course'] ?? '',
      isAdmin: json['is_admin'] ?? '',
      status: Status.values.firstWhere(
          (stat) => stat.toString().split('.').last == json['status'],
          orElse: () => Status.ACTIVE),
      courseOverviewProvider: CourseOverviewProvider.values.firstWhere(
          (provider) =>
              provider.toString().split('.').last ==
              json['course_overview_provider'],
          orElse: () => CourseOverviewProvider.EMPTY),
      metaKeywords: json['meta_keywords'] ?? '',
      metaDescription: json['meta_description'] ?? '',
      isFreeCourse: json['is_free_course'],
      topCoureExternal: json['top_coure_external'] ?? '',
      externalLink: json['external_link'] ?? '',
      rating: json['rating'] ?? 0,
      numberOfRatings: json['number_of_ratings'] ?? 0,
      instructorName: InstructorName.values.firstWhere(
          (name) => name.toString().split('.').last == json['instructor_name'],
          orElse: () => InstructorName.EMPTY),
      totalEnrollment: json['total_enrollment'] ?? 0,
      shareableLink: json['shareable_link'] ?? '',
      fullPrice: json['full_price'] ?? '',
      videoCount: json['video_count'] ?? '',
    );
  }
}

enum CourseOverviewProvider { EMPTY, VIMEO, YOUTUBE }

enum InstructorName { EMPTY }

enum Language { ENGLISH }

enum Level { BEGINNER, ADVANCED }

enum Status { ACTIVE }
