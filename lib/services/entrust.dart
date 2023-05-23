import 'package:flutter/foundation.dart';

import '../configs/configs.dart';
import 'package:flutter/services.dart';

class EntrustService {
  static Future<void> getInstance(String deviceId) async {
    try {
      final Map<String, dynamic> methodBody = {
        EntrustParams.deviceId: deviceId,
      };

      await EntrustConfig.channel.invokeMethod(
        EntrustMethods.getInstance,
        methodBody,
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<void> insertSeed(String activationUrl) async {
    try {
      final Map<String, dynamic> methodBody = {
        EntrustParams.activationOnlineHttpURL: activationUrl,
      };

      await EntrustConfig.channel.invokeMethod(
        EntrustMethods.insertSeed,
        methodBody,
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  static Future<String?> getOTP() async {
    try {
      final result = await EntrustConfig.channel.invokeMethod(
        EntrustMethods.getOTP,
      );
      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  static Future<String?> getTransactions() async {
    try {
      final result = await EntrustConfig.channel.invokeMethod(
        EntrustMethods.getTransactions,
      );

      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  static Future<bool?> setResponseTransaction(
      String transactionId, String action) async {
    try {
      final Map<String, dynamic> methodBody = {
        EntrustParams.transactionId: transactionId,
        EntrustParams.action: action,
      };

      final result = await EntrustConfig.channel.invokeMethod(
        EntrustMethods.acceptTransaction,
        methodBody,
      );

      return result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.message.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
