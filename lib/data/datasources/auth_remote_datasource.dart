import 'package:flutter_fic9_ecommerce_jajangmahrul_app/data/models/request/login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../common/constants/variabels.dart';
import '../models/request/register_request_model.dart';
import '../models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel request) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
      body: request.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel request) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local'),
      body: request.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
