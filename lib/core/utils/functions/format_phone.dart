String formatPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return '';
  }

  // Remove qualquer caractere não numérico
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Verifica se o número tem o tamanho correto
  if (phoneNumber.length == 10) {
    return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
  }

  // Se o número não for válido, retorna em branco
  return '';
}
