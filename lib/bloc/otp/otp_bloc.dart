// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/data/repository/otp_repo.dart';
import 'package:zybo/data/shared_pref.dart';

import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OTPRepository _repository;

  OtpBloc(this._repository) : super(const OtpState()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<RegisterUserEvent>(_onRegisterUser);
  }

  Future<void> _onSendOtp(
    SendOtpEvent event, 
    Emitter<OtpState> emit
  ) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      final otpModel = await _repository.getMobileOtpApi(event.phoneNumber);
      emit(state.copyWith(
        status: OtpStatus.otpSent,
        otpModel: otpModel
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OtpStatus.error,
        errorMessage: e.toString()
      ));
    }
  }

  Future<void> _onVerifyOtp(
    VerifyOtpEvent event, 
    Emitter<OtpState> emit
  ) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      final otpModel = await _repository.getMobileOtpApi(event.phoneNumber);
      
      if (otpModel.otp == event.otp) {
        await SharedPrefsHelper.addMobileNumber(event.phoneNumber);
        
        if (otpModel.user == true) {
          emit(state.copyWith(
            status: OtpStatus.verified,
            otpModel: otpModel
          ));
        } else {
          emit(state.copyWith(status: OtpStatus.newUser));
        }
      } else {
        emit(state.copyWith(
          status: OtpStatus.error,
          errorMessage: 'Invalid OTP'
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: OtpStatus.error,
        errorMessage: e.toString()
      ));
    }
  }

  Future<void> _onRegisterUser(
    RegisterUserEvent event, 
    Emitter<OtpState> emit
  ) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      final otpModel = await _repository.loginRegisterApi(
        event.phoneNumber, 
        event.firstName
      );
      
      await SharedPrefsHelper.addMobileNumber(event.phoneNumber);
      
      emit(state.copyWith(
        status: OtpStatus.verified,
        otpModel: otpModel
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OtpStatus.error,
        errorMessage: e.toString()
      ));
    }
  }
}