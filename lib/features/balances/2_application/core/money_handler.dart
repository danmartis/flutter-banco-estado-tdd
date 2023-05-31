import 'package:extended_masked_text/extended_masked_text.dart';

abstract class MoneyHandler {
  static String _cleanFormat(String money) {
    return money.replaceAll(RegExp(r'[\$\.,]'), '');
  }

  factory MoneyHandler(
    String? money, {
    String thousandSeparator = '.',
    String decimalSeparator = '',
    int precision = 0,
    String currencySymbol = '\$',
  }) {
    return Money.init(_cleanFormat(money ?? ''),
        thousandSeparator: thousandSeparator,
        decimalSeparator: decimalSeparator,
        precision: precision,
        currencySymbol: currencySymbol);
  }

  String get raw;
  String get formatted;
}

class Money implements MoneyHandler {
  final String _money;
  String thousandSeparator;
  String decimalSeparator;
  int precision;
  String currencySymbol;

  Money.init(
    this._money, {
    this.thousandSeparator = '.',
    this.decimalSeparator = '',
    this.precision = 0,
    this.currencySymbol = '\$',
  });

  @override
  String get formatted {
    String mask = '';
    String reversedMoney = _money.split('').reversed.join();
    for (int i = 0; i < reversedMoney.length; i++) {
      if (i != 0 && i % 3 == 0) {
        mask += thousandSeparator;
      }
      mask += '0';
    }
    mask = mask.split('').reversed.join();
    mask = currencySymbol + mask;
    final maskController = MaskedTextController(
      text: _money,
      mask: mask,
    );
    return maskController.text;
  }

  @override
  String get raw => _money;
}
