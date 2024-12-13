class PBLShopDTO {
  String? id;
  String? title;
  String? code;
  String? image;
  String? price;
  String? registration;
  String? mileage;
  String? condition;
  String? available;
  bool? status;

  PBLShopDTO(
      {this.id,
      this.title,
      this.code,
      this.image,
      this.price,
      this.registration,
      this.mileage,
      this.condition,
      this.available,
      this.status});

  PBLShopDTO.fromJson(json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    image = json['image'];
    price = json['price'];
    registration = json['registration'];
    mileage = json['mileage'];
    condition = json['condition'];
    available = json['available'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['code'] = code;
    data['image'] = image;
    data['price'] = price;
    data['registration'] = registration;
    data['mileage'] = mileage;
    data['condition'] = condition;
    data['available'] = available;
    data['status'] = status;
    return data;
  }
}
