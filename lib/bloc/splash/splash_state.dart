part of 'splash_bloc.dart';

final class SplashState extends Equatable {
  const SplashState({
    this.loadingStatus = LoadingStatus.loading,
  });
  final LoadingStatus loadingStatus;

  @override
  List<Object> get props => [LoadingStatus];
}
