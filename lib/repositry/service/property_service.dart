import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rafah_fam_test/core/utils/app_contant.dart';

import '../../presentation/property_list/model/property_model.dart';

class PropertyService {
  PropertyService({
    http.Client? httpClient,
    this.baseUrl = AppConstant.baseUrl,
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client _httpClient;

  /// this use it usualy to handle api but in this test no need for it
  // Uri getUrl({
  //   required String url,
  //   Map<String, String>? extraParameters,
  // }) {
  //   final queryParameters = <String, String>{

  //   };
  //   if (extraParameters != null) {
  //     queryParameters.addAll(extraParameters);
  //   }

  //   return Uri.parse('$baseUrl').replace(
  //     queryParameters: queryParameters,
  //   );
  // }

  Future<List<Property>> fetchProperties() async {
    final response = await _httpClient.get(Uri.parse(AppConstant.baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['items'];
      List<Property> properties =
          jsonData.map((data) => Property.fromJson(data)).toList();
      return properties;
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
