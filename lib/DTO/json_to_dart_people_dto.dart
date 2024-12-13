class PeopleDtoJSONToDart {
  String? id;
  String? name;
  String? image;
  Chat? chat;
  String? time;
  List<Users>? users;

  PeopleDtoJSONToDart(
      {this.id, this.name, this.image, this.chat, this.time, this.users});

  PeopleDtoJSONToDart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
    time = json['time'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (chat != null) {
      data['chat'] = chat!.toJson();
    }
    data['time'] = time;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chat {
  String? content;
  int? pending;

  Chat({this.content, this.pending});

  Chat.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    pending = json['pending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] =content;
    data['pending'] = pending;
    return data;
  }
}

class Users {
  String? id;
  String? name;
  String? phone;
  bool? online;
  String? image;
  bool? sender;

  Users({this.id, this.name, this.phone, this.online, this.image, this.sender});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    online = json['online'];
    image = json['image'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['online'] = online;
    data['image'] = image;
    data['sender'] = sender;
    return data;
  }
}


