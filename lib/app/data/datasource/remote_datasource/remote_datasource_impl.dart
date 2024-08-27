import 'dart:convert';
import 'dart:io';
import 'package:flutter_task/app/data/params/params.dart';
import 'package:flutter_task/app/utils/constants/baseurl.dart';
import 'package:flutter_task/app/utils/loader/loader.dart';
import 'package:http/http.dart' as http;
import '../../errors/api_error.dart';
import 'remote_datasource.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<bool> saveUserData({required SaveUserParams params}) async {
    final data = {
      "checkinDateTime": params.checkInDateTime,
      "checkoutDateTime": params.checkOutDateTime,
      "name": params.name,
      "breakTime": params.breakTime,
    };
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/tracking/checkin-checkout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer TOKKEN IS HERE',
        },
        body: jsonEncode(data),
      );
      Map dCodedRes = jsonDecode(response.body);
      if (response.statusCode != 200) {
        Load.error(dCodedRes['Data']['message']);
        throw Exception('Failed to update check-in/check-out');
      }
      Load.success(dCodedRes['Data']['message']);
      return dCodedRes['success'];
    } on SocketException {
      throw NetworkException();
    } catch (e) {
      throw ServerException();
    }
  }
}
