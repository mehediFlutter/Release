class GetAllVehicleDTO {
  String? id;
  String? title;
  String? code;
  String? image;
  String? price;
  String? registration;
  String? mileage;
  String? condition;
  String? available;
  Editable? editable;

  GetAllVehicleDTO(
      {this.id,
      this.title,
      this.code,
      this.image,
      this.price,
      this.registration,
      this.mileage,
      this.condition,
      this.available,
      this.editable});

  GetAllVehicleDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    image = json['image'];
    price = json['price'];
    registration = json['registration'];
    mileage = json['mileage'];
    condition = json['condition'];
    available = json['available'];
    editable =
        json['editable'] != null ? Editable.fromJson(json['editable']) : null;
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
    if (editable != null) {
      data['editable'] = editable!.toJson();
    }
    return data;
  }
}

class Editable {
  String? asking;
  String? purchase;
  String? fixed;

  Editable({this.asking, this.purchase, this.fixed});

  Editable.fromJson(Map<String, dynamic> json) {
    asking = json['asking'];
    purchase = json['purchase'];
    fixed = json['fixed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asking'] = asking;
    data['purchase'] = purchase;
    data['fixed'] = fixed;
    return data;
  }
}
