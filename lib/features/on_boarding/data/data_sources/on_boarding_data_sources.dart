import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/core/network_and_exceptions/custom_exception.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/set_profile_usecase.dart';
import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingDataSource {
  Future<void> sendOtp(Phone phone);
  Future<void> verifyOtp(Otp otp);
  Future<void> setProfile(ProfileParam param);
}

@LazySingleton(as: OnBoardingDataSource)
@injectable
class OnBoardingDataSourceImpl implements OnBoardingDataSource {
  final Dio dio;

  OnBoardingDataSourceImpl(this.dio);
  @override
  Future<void> sendOtp(Phone phone) async {
    try {
      await dio.post(
        ApiEndpoints.sendOtp,
        data: {"phoneNumber": phone.phoneNumber},
      );
      return;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }

  @override
  Future<void> verifyOtp(Otp otp) async {
    try {
      final resp = await dio.post(ApiEndpoints.verifyOtp,
          data: {"phoneNumber": otp.phone, "otp": otp.otp});
      if (resp.statusCode == 200) {
        final String token = resp.data['token'];
        SharedPreferences shared = await SharedPreferences.getInstance();
        await shared.setString('token', token);
        await shared.setString("phone", otp.phone);
        return;
      }
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }

  @override
  Future<void> setProfile(ProfileParam param) async {
    try {
      final formData = FormData.fromMap({
        "name": param.name,
        "profileImage": param.image == null
            ? null
            : await MultipartFile.fromFile(
                param.image!.path,
                filename: param.image!.path.split("/").last,
              )
      });
      SharedPreferences shared = await SharedPreferences.getInstance();
      final token = shared.getString('token');
      await dio.post(ApiEndpoints.setProfile,
          data: formData,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      shared.setBool("profile", true);
      return;
    } on DioException catch (e) {
      throw CustomException.fromDioError(e);
    } catch (e) {
      throw CustomException.otherException(e.toString());
    }
  }
}
