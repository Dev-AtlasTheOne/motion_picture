class Movie {
  int? id;
  int price;
  int stockNumber;
  String title;

  Movie({this.price = 0, this.stockNumber = 0, this.title = ''});

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
      title: mapa['title'],
      price: mapa['price'],
      stockNumber: mapa['stockNumber'],
    );
  }
}
