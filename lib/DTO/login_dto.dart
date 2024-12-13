class CacheLoginDTO {
  String? id;
  String? name;
  String? phone;
  String? image;
  String? company;
  String? token;

  CacheLoginDTO(
      {this.id, this.name, this.phone, this.image, this.company, this.token});

  CacheLoginDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    company = json['company'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['image'] = image;
    data['company'] = company;
    data['token'] = token;
    return data;
  }
}
