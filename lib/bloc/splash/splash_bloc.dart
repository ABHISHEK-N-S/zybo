

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enums.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));

      emit(const SplashState(
        loadingStatus: LoadingStatus.success,
      ));
    });
  }
}
