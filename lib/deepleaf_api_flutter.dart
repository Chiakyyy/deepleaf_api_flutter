
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class DeepleafApiFlutter {
  
  final methodChannel = const MethodChannel('deepleaf_api_flutter');

  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  final String apiKey;
  final String language;

  // Constructor
  DeepleafApiFlutter({
    required this.apiKey,
    this.language = 'en'
  });

  Future<http.Response> sendImageToAPI({
      required Uint8List imageBytes,
      required double latitude,
      required double longitude,
  }) async {
    final uri = Uri.parse(
      "https://api.deepleaf.io/analyze"
      "?api_key=$apiKey"
      "&lat=$latitude"
      "&lon=$longitude"
      "&language=$language",
    );

    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: 'plant.jpg',
        contentType: MediaType('image', 'jpeg'),
      ));

    final response = await http.Response.fromStream(await request.send());
    return response;
  }

  Future<http.Response> getAPIUsage() async {
    final uri = Uri.parse("https://api.deepleaf.io/usage?api_key=$apiKey");
      final response = await http.get(uri);
      return response;
  }
}
