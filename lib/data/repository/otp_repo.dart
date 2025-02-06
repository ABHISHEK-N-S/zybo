// import 'package:logger/logger.dart';
// import 'package:zybo/data/datasource/otp_datasource.dart';
// import 'package:zybo/data/model/otp_model.dart';
// import 'package:zybo/error/exceptions.dart';
// import 'package:zybo/helper/logger.dart';

// class OTPRepository {
//   final OtpDatasource _dataSource;

//   OTPRepository({
//     required OtpDatasource dataSource,
//   }) : _dataSource = dataSource;

//   Future<OtpListModel> getMobileOtpApi(mobilenum) async {
//     try {
//       final OtpListModel response = (await _dataSource.getMobileOtpApi(mobilenum));
//       return response;
//     } on APIException catch (e) {
//       logger.log(Level.debug, e);
//       rethrow;
//     }
//   }
// }
import 'package:zybo/data/datasource/otp_datasource.dart';
import 'package:zybo/data/model/otp_model.dart';

class OTPRepository {
  final OtpDatasource _dataSource;

  OTPRepository({required OtpDatasource dataSource}) : _dataSource = dataSource;

  Future<OtpListModel> getMobileOtpApi(String phoneNumber) async {
    try {
      return await _dataSource.getMobileOtpApi(phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpListModel> loginRegisterApi(String phoneNumber, String firstName) async {
    try {
      final response = await _dataSource.loginRegisterApi(phoneNumber, firstName);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
