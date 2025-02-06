




// import 'package:equatable/equatable.dart';
// import 'package:zybo/data/model/otp_model.dart';

// final class OtpState extends Equatable {
//   final String error;
//   final bool loading;
//   final bool subscribed;
//   final OtpListModel? data;

//   const OtpState({
//     this.error = '',
//     this.loading = false,
//     this.subscribed = false,
//     this.data,
//   });

//   OtpState copyWith({
//     final String? error,
//     final bool? loading,
//     final bool? subscribed,
//     final OtpListModel? data,
//   }) {
//     return OtpState(
//       error: error ?? this.error,
//       loading: loading ?? this.loading,
//       subscribed: subscribed ?? this.subscribed,
//       data: data ?? this.data,
//     );
//   }

//   @override
//   List<Object> get props => <Object>[
//         error,
//         loading,
//         subscribed,
//         data ?? '',
//       ];
// }

import 'package:equatable/equatable.dart';
import 'package:zybo/data/model/otp_model.dart';

enum OtpStatus { initial, loading, otpSent, verified, newUser, error }

class OtpState extends Equatable {
  final OtpStatus status;
  final OtpListModel? otpModel;
  final String? errorMessage;

  const OtpState({
    this.status = OtpStatus.initial,
    this.otpModel,
    this.errorMessage,
  });

  OtpState copyWith({
    OtpStatus? status,
    OtpListModel? otpModel,
    String? errorMessage,
  }) => OtpState(
    status: status ?? this.status,
    otpModel: otpModel ?? this.otpModel,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, otpModel, errorMessage];
}
