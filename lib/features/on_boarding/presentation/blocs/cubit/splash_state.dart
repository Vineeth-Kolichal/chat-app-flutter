part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({required String? nextRoute}) = _Initial;
  factory SplashState.initial() => const SplashState(nextRoute: null);
}
