// import 'package:dio/dio.dart';
// import 'package:zybo/data/model/otp_model.dart';
// import 'package:zybo/data/service/otp_service.dart';
// import 'package:zybo/error/exceptions.dart';
// import 'package:zybo/main.dart';

// class OtpDatasource {
//   OtpDatasource();
//   final OtpService service = autoInjector.get<OtpService>();

//   Future<OtpListModel> getMobileOtpApi(mobilenum) async {
//     try {
//       final Response? response = await service.getMobileOtpApi(mobilenum);
//       final OtpListModel model =
//           OtpListModel.fromJson(response?.data as Map<String, dynamic>);
//       return model;
//     } on APIException {
//       rethrow;
//     } catch (e) {
//       throw APIException(
//         message: e.toString(),
//         statusCode: 505,
//       );
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:zybo/data/model/otp_model.dart';
import 'package:zybo/data/service/otp_service.dart';
import 'package:zybo/error/exceptions.dart';
import 'package:zybo/main.dart';

class OtpDatasource {
  final OtpService service = autoInjector.get<OtpService>();

  Future<OtpListModel> getMobileOtpApi(String phoneNumber) async {
    try {
      final Response? response = await service.getMobileOtpApi(phoneNumber);
      return OtpListModel.fromJson(response?.data as Map<String, dynamic>);
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  Future<OtpListModel> loginRegisterApi(String phoneNumber, String firstName) async {
    try {
      final Response? response = await service.loginRegisterApi(phoneNumber, firstName);
      return OtpListModel.fromJson(response?.data as Map<String, dynamic>);
    } catch (e) {
      throw APIException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
