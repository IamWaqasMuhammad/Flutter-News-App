import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/quote_model.dart';

class QuoteServices {
  var baseUrl = 'https://dummyjson.com/';

  getQuotes() async {
    List<QuoteModel> quoteList = [];
    try {
      var response = await http.get(Uri.parse("${baseUrl}quotes"));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodeData = jsonDecode(data);
        var quotes = decodeData['quotes'];
        for (var quote in quotes) {
          QuoteModel newQuote = QuoteModel.fromJson(quote);
          quoteList.add(newQuote);
        }
      }
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
