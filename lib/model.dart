import 'dart:convert';
import 'package:flutter/services.dart';

Future<List> loadPosts() async {
  String text = await rootBundle.loadString('assets/posts.json');
  return jsonDecode(text);
}
