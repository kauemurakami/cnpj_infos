import 'package:cnpj_infos/core/constants/strings.dart';
import 'package:cnpj_infos/core/utils/extensions/remove_mask_cnpj.dart';
import 'package:cnpj_infos/data/models/app_error.dart';
import 'package:cnpj_infos/data/models/cnpj.dart';
import 'package:cnpj_infos/data/models/either.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(baseUrl: AppStrings.baseUrl));

  Future<Either<AppError, Cnpj>> fetchCnpjData(String cnpj) async {
    print('/${cnpj.removeMask}');

    try {
      final response = await _dio.get('/${cnpj.removeMask}');
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Either.right(Cnpj.fromJson(response.data));
      }
      return Either.left(AppError.fromJson(response.data));
    } catch (e) {
      return Either.left(AppError(name: 'Error', message: 'Insira um CNPJ válido'));
    }
  }
}
