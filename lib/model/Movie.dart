class Movie {
  int? id;
  double price;
  int stockNumber;
  String title;

  Movie({this.id ,this.price = 0, this.stockNumber = 0, this.title = ''});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> mapa = {
  
      'title': title,
      'price': price,
      'stockNumber': stockNumber,
    };

    if (id != null) {
      mapa['id'] = id;
    }

    return mapa;
  }

  factory Movie.fromMap(Map<String, dynamic> mapa) {
  return Movie(
    id: mapa['id'],
    title: mapa['title'],
    price: (mapa['price'] as num).toDouble(),
    stockNumber: mapa['stockNumber'],
  );
}
}
