

String formatPriceCLP(int price) {
  final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final String numberString = price.toString();

  return numberString.replaceAllMapped(regex, (Match match) => '${match[1]}.');
}