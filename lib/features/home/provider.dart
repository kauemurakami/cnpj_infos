import 'package:cnpj_infos/core/utils/extensions/remove_mask_cnpj.dart';
import 'package:cnpj_infos/data/models/app_error.dart';
import 'package:cnpj_infos/data/models/cnpj.dart';
import 'package:cnpj_infos/data/models/either.dart';
import 'package:cnpj_infos/features/home/repository.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository;
  ValueNotifier<Cnpj> cnpj = ValueNotifier(Cnpj());
  ValueNotifier<bool> load = ValueNotifier(false);
  HomeProvider(this.repository);

  Future<Either<AppError, Cnpj>> fetchCnpjInfos() async {
    load.value = true;
    notifyListeners();
    final Either<AppError, Cnpj> result = await repository.fetchCnpjInfos(cnpj.value.cnpj!);
    load.value = false;
    notifyListeners();
    result.fold((AppError error) {
      //TODO another handler errors
    }, (Cnpj cnpj) {
      this.cnpj.value = cnpj;
      this.cnpj.notifyListeners();
    });
    return result;
  }

  onChangedCnpj(String value) {
    cnpj.value.cnpj = value;
    cnpj.notifyListeners();
  }

  onsavedCnpj(String value) {
    cnpj.value.cnpj = value.removeMask;
    cnpj.notifyListeners();
  }

  validateCnpj(String value) {
    if (value.length < 18 || value.length > 18) {
      return 'Insira um CNPJ válido';
    }
    return null;
  }
}
