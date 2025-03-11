import 'package:intl/intl.dart';

String formatDate(DateTime? date) => date == null ? '' : DateFormat('dd/MM/yyyy').format(date);

// String formatDate(String date) {
//   List<String> parts = date.split('-');
//   if (parts.length != 3) return date; // Retorna a data original se o formato estiver incorreto
//   return '${parts[2]}/${parts[1]}/${parts[0]}';
// }
