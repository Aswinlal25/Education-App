import 'dart:convert';
import 'dart:developer';

import 'package:futursity/model/Categores/model.dart';
import 'package:http/http.dart' as http;

class CourseService {
  Future<List<dynamic>> fetchTopCourses() async {
    final response = await http
        .get(Uri.parse('https://futursity.com/course/api/top_courses'));
    if (response.statusCode == 200) {
      log(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load top courses');
    }
  }

  Future<List<Categores>> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://futursity.com/course/api/categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Categores>.from(data.map((item) => Categores.fromJson(item)));
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
