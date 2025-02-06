// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:zybo/constants/api_constants.dart';
// import 'package:zybo/data/base_service.dart';

// class OtpService extends DioBaseService {
//   final Dio _dio = DioBaseService.dio;
 
//   Future<Response<dynamic>?> getMobileOtpApi(
//     num mobilenum,
//   ) async {
//     try {
//       Object body = {
//         "data":{ "phone_number": mobilenum}
//       };
//       log(body.toString(), name: 'body');
//       return await _dio.post(
//         ApiConst.otpgeneration,
//         data: body,
//       );
//     } on DioException catch (e) {
//       // Handle DioError
//       log('Dio error: $e');
//       if (e.response != null) {
//         log('Dio error status: ${e.response!.statusCode}');
//         log('Dio error message: ${e.response!.statusMessage}');
//         log('Dio error data: ${e.response!.data}');
//       } else {
//         log('Dio request failed due to an exception: $e');
//       }
//       // Return null or rethrow the DioError to propagate it further
//       rethrow;
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:zybo/constants/api_constants.dart';
import 'package:zybo/data/base_service.dart';

class OtpService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
 
  Future<Response<dynamic>?> getMobileOtpApi(String phoneNumber) async {
    try {
      Object body = {
        "data": {"phone_number": phoneNumber}
      };
      return await _dio.post(
        ApiConst.otpgeneration,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>?> loginRegisterApi(String phoneNumber, String firstName) async {
    try {
      Object body = {
        "first_name": firstName,
        "phone_number": phoneNumber
      };
      return await _dio.post(
        ApiConst.loginRegister,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }
}