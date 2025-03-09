import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AppMasks {
  static final cnpjFormatter = MaskTextInputFormatter(
    mask: '##.###.###/####-##', // Máscara do CNPJ
    filter: {"#": RegExp(r'[0-9]')}, // Permitindo apenas números
  );
}
