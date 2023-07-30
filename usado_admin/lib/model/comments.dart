class Bids{
  late String? id;
  late String name;
  late String answer;
  late String date;
  late String image;



  Bids({required this.name,required this.answer,required this.image,required this.date});

  Bids.fromMap(Map<String,dynamic> map){
    id=map['id'];
    name=map['name'];
    answer=map['answer'];
    image=map['image'];
    date=map['date'];

  }
  Map<String,dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['name'] = name;
    map['answer'] = answer;
    map['image'] = image;
    map['date'] = date;

    return map;
  }
}