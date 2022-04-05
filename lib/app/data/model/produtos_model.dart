// ignore_for_file: unnecessary_this, prefer_collection_literals

class Produtos {
  String? id;
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  double? price;
  double? rating;

  Produtos(
      {this.title,
      this.type,
      this.description,
      this.filename,
      this.height,
      this.width,
      this.price,
      this.rating});

  Produtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    filename = json['filename'];
    height = json['height'];
    width = json['width'];
    price = json['price'];
    rating = double.parse(json['rating'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    data['filename'] = this.filename;
    data['height'] = this.height;
    data['width'] = this.width;
    data['price'] = this.price;
    data['rating'] = this.rating;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'type': type,
      'description': description,
      'filename': filename,
      'height': height,
      'width': width,
      'price': price,
      'rating': rating
    };
  }

  factory Produtos.fromMap(Map<String, dynamic> map) {
    return Produtos(
        title: map['title'].toString(),
        type: map['type'].toString(),
        description: map['description'].toString(),
        filename: map['filename'].toString(),
        height: map['height'],
        width: map['width'],
        price: map['price'],
        rating: map['rating']);
  }
}
