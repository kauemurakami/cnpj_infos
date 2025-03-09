import 'package:cnpj_infos/services/api.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupoLocator() {
  getIt.registerLazySingleton(() => ApiService());
}
