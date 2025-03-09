import 'package:cnpj_infos/data/models/app_error.dart';
import 'package:cnpj_infos/data/models/cnpj.dart';
import 'package:cnpj_infos/data/models/either.dart';
import 'package:cnpj_infos/services/api.dart';

class HomeRepository {
  final ApiService api;

  HomeRepository(this.api);
  Future<Either<AppError, Cnpj>> fetchCnpjInfos(String cnpj) => api.fetchCnpjData(cnpj);
}
