class Flat {
  late int id;
  late String name;
  late String category;
  late String description;
  late int rent;
  late String meterNo;
  late bool status;

  Flat(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.rent,
      required this.meterNo,
      required this.status});

  Flat.fromObject(dynamic obj) {
    id = obj['id'];
    name = obj['name'];
    category = obj['category'];
    description = obj['description'];
    rent = obj['rent'];
    meterNo = obj['meterNo'];
    status = obj['status'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['category'] = category;
    map['description'] = description;
    map['rent'] = rent;
    map['meterNo'] = meterNo;
    map['status'] = status;

    if (id != 0) {
      map['id'] = id;
    }

    return map;
  }
}
