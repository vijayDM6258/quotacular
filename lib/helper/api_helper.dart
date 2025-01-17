import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class QuotesApi {
  static const String baseUrl = 'https://api.quotable.io';

  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse('$baseUrl/quotes?page=1'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final quotes = (jsonData['results'] as List<dynamic>)
          .map((quoteJson) => Quote.fromJson(quoteJson))
          .toList();
      return quotes;
    } else {
      throw Exception('Failed to fetch quotes');
    }
  }
}