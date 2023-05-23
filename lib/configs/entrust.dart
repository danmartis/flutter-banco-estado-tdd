import 'package:flutter/services.dart';

class EntrustConfig {
  static const MethodChannel channel = MethodChannel('channel/app_beche_poc');
}

class EntrustMethods {
  static const String getInstance = 'getInstance';
  static const String insertSeed = 'insertSeed';
  static const String getOTP = 'getOTP';
  static const String getTransactions = 'getTransactions';
  static const String acceptTransaction = 'setResponseTransaction';
}

class EntrustParams {
  static const String activationOnlineHttpURL = 'activationOnlineHttpURL';
  static const String deviceId = 'deviceId';
  static const String transactionId = 'transactionId';
  static const String action = 'action';
}

class EntrustTransactions {
  static const String confirm = 'CONFIRM';
  static const String cancel = 'CANCEL';
}
