// part of 'otp_bloc.dart';

//  class OtpEvent extends Equatable {
//   const OtpEvent();

//   @override
//   List<Object> get props => [];
// }
//  class MobileEvent extends OtpEvent {
//   final num mobilenum;
//   const MobileEvent(this.mobilenum);
// }

import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class SendOtpEvent extends OtpEvent {
  final String phoneNumber;

  const SendOtpEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtpEvent extends OtpEvent {
  final String phoneNumber;
  final String otp;

  const VerifyOtpEvent(this.phoneNumber, this.otp);

  @override
  List<Object?> get props => [phoneNumber, otp];
}

class RegisterUserEvent extends OtpEvent {
  final String phoneNumber;
  final String firstName;

  const RegisterUserEvent(this.phoneNumber, this.firstName);

  @override
  List<Object?> get props => [phoneNumber, firstName];
}
