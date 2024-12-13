class UsersDTO {
  String? id;
  String? name;
  String? phone;
  bool? online;
  String? image;
  bool? sender;

  UsersDTO({
    this.id,
    this.name,
    this.phone,
    this.online,
    this.image,
    this.sender,
  });

  // Constructor for a single user JSON object
  UsersDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    online = json['online'];
    image = json['image'];
    sender = json['sender'];
  }

  // New method to handle a list of user JSON objects
  static List<UsersDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UsersDTO.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['online'] = online;
    data['image'] = image;
    data['sender'] = sender;
    return data;
  }

  @override
  String toString() {
    return 'UsersDTO(id: $id, name: $name, phone: $phone, online: $online, image: $image, sender: $sender)';
  }
}
