class Product {
  late String? id;
  late String? catId;
  late String productHolder;
  late String? productHolderImage;
  late num productHolderNumber;

  late String image;
  late String name;
  late String color;
  late String location;
  late String usedTime;
  late String operation;
  late String publishDate;
  late String categoryName;

  late num price;

  late String? buyerName;
  late String? buyerImage;

  Product({
    required this.name,
    required this.image,
    required this.color,
    required this.location,
    required this.categoryName,
    required this.price,
    required this.operation,
    required this.publishDate,
    required this.productHolder,
    required this.usedTime,
    required this.catId,
    required this.productHolderNumber,
    this.productHolderImage,
    this.buyerName,
    this.buyerImage,
  });

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    productHolder = map['productHolder'];
    price = map['price'];
    categoryName = map['categoryName'];
    operation = map['operation'];
    publishDate = map['publishDate'];
    color = map['color'];
    image = map['image'];
    usedTime = map['usedTime'];
    catId = map['catId'];
    buyerName = map['buyerName'];
    buyerImage = map['buyerImage'];
    productHolderImage = map['productHolderImage'];
    productHolderNumber = map['productHolderNumber'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['productHolder'] = productHolder;
    map['price'] = price;
    map['categoryName'] = categoryName;
    map['operation'] = operation;
    map['publishDate'] = publishDate;
    map['color'] = color;
    map['image'] = image;
    map['usedTime'] = usedTime;
    map['catId'] = catId;
    map['buyerName'] = buyerName;
    map['buyerImage'] = buyerImage;
    map['productHolderImage'] = productHolderImage;
    map['productHolderNumber'] = productHolderNumber;
    return map;
  }
}
