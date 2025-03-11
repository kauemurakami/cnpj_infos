import 'package:flutter/services.dart';

hideKeyboard() async => await SystemChannels.textInput.invokeMethod('TextInput.hide');
