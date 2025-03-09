extension RemoveMaskCnpj on String {
  String get removeMask => replaceAll('.', '').replaceAll('/', '').replaceAll('-', '');
}
