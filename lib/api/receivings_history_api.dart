import 'dart:convert';

import 'package:ak_enterprises_app/models/receivings_history_model.dart';
import 'package:ak_enterprises_app/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<List<ReceivingsHistoryModel>> getAllRecevingsHisotry(
    String voucherDate) async {
  try {
    String url =
        "${APIConstants.baseUrl}/ReceivingsHistory/GetAllDateWiseReceivingsHistory/";

    Map<String, dynamic> jsonBody = {'VoucherDate': voucherDate};

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonBody));

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (responseBody['success'] == true) {
      List<dynamic> data = responseBody['data'];
      return data.map((item) => ReceivingsHistoryModel.fromJson(item)).toList();
    } else {
      throw Exception("${responseBody['error']}");
    }
  } catch (e) {
    throw Exception("Failed to load deliveries!");
  }
}
