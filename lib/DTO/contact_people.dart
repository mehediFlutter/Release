class CPUserDTO {
  String? id;
  String? name;
  bool? online;
  String? image;

  CPUserDTO({this.id, this.name, this.online, this.image});

  factory CPUserDTO.fromJson(Map<String, dynamic> json) {
    return CPUserDTO(
      id: json['id'],
      name: json['name'],
      online: json['online'],
      image: json['image'],
    );
  }

  factory CPUserDTO.fromObject(Map<String, dynamic> data) {
    return CPUserDTO(
      id: data['id'],
      name: data['name'],
      online: data['online'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'online': online,
      'image': image,
    };
  }
}

class ChatContentDTO {
  String? genre;
  List? listGenre;
  String? input;
  bool? stack = false;

  ChatContentDTO({this.genre, this.input,  this.stack, this.listGenre});

  factory ChatContentDTO.fromObject(Map<String, dynamic> data) {
    bool isStack = data['stack']??false;
    return ChatContentDTO(
        genre: data['genre'], 
        input: isStack==false? data['input']:'', 
        stack: data['stack'],
        listGenre: isStack==true? data['input']:[]

        );

  }
  factory ChatContentDTO.fromJson(Map<String, dynamic> json) {
    return ChatContentDTO(
        genre: json['genre'], input: json['input'], stack: json['stack']);
  }
  Map<String, dynamic> toJson() {
    return {'genre': genre, 'input': input, 'stack': stack};
  }
}

class CPChatDTO {
  List<Map<String, dynamic>>? reacted;
  ChatContentDTO? content;
  int? pending = 0;

  CPChatDTO({this.content, this.reacted, this.pending});

  factory CPChatDTO.fromJson(Map<String, dynamic> json) {
    return CPChatDTO(
        content: ChatContentDTO.fromJson(json['content']),
        reacted: json['reacted'],
        pending: json['pending']);
  }
  factory CPChatDTO.fromObject(Map<String, dynamic> data) {
    return CPChatDTO(
        content: ChatContentDTO.fromObject(data['content']),
        reacted: data['reacted'],
        pending: data['pending']);
  }

  Map<String, dynamic> toJson() {
    return {'content': content, 'reacted': reacted, 'pending': pending};
  }
}

class CPTimeDTO {
  String? string;
  String? elapse;
  String? format;

  CPTimeDTO({this.string, this.elapse, this.format});

  factory CPTimeDTO.fromJson(Map<String, dynamic> json) {
    return CPTimeDTO(
      string: json['string'],
      elapse: json['elapse'],
      format: json['format'],
    );
  }
  factory CPTimeDTO.fromObject(Map<String, dynamic> data) {
    return CPTimeDTO(
      string: data['string'],
      elapse: data['elapse'],
      format: data['format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'string': string,
      'elapse': elapse,
      'format': format,
    };
  }
}

class ContactPeopleDTO {
  String? id;
  String? name;
  CPUserDTO? user;
  CPChatDTO? chat;
  CPTimeDTO? time;

  ContactPeopleDTO({this.id, this.name, this.user, this.chat, this.time});

  factory ContactPeopleDTO.fromJson(Map<String, dynamic> json) {
    return ContactPeopleDTO(
      id: json['room'] != null ? json['room']['id'] : null,
      name: json['room'] != null ? json['room']['name'] : null,
      user: json['user'] != null ? CPUserDTO.fromJson(json['user']) : null,
      chat: json['chat'] != null ? CPChatDTO.fromJson(json['chat']) : null,
      time: json['time'] != null ? CPTimeDTO.fromJson(json['time']) : null,
    );
  }

  factory ContactPeopleDTO.fromObject(Map<String, dynamic> data) {
    return ContactPeopleDTO(
      id: data['room'] != null ? data['room']['id'] : null,
      name: data['room'] != null ? data['room']['name'] : null,
      user: data['user'] != null ? CPUserDTO.fromObject(data['user']) : null,
      chat: data['chat'] != null ? CPChatDTO.fromObject(data['chat']) : null,
      time: data['time'] != null ? CPTimeDTO.fromObject(data['time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'room': {
        'id': id,
        'name': name,
      },
      'user': user?.toJson(),
      'chat': chat?.toJson(),
      'time': time?.toJson(),
    };
  }

  @override
  String toString() {
    return 'Room ID: $id, Room Name: $name, User: ${user?.name}, Online: ${user?.online}, Last Message: ${chat?.content}, Time: ${time?.string}';
  }
}




