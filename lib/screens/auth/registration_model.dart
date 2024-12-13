// class RegistrationModel {
//   String? status;
//   Null message;
//   Payload? payload;

//   RegistrationModel({this.status, this.message, this.payload});

//   RegistrationModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     payload =
//         json['payload'] != null ?  Payload.fromJson(json['payload']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (payload != null) {
//       data['payload'] = payload!.toJson();
//     }
//     return data;
//   }
// }

// class Payload {
//   User? user;
//   String? token;

//   Payload({this.user, this.token});

//   Payload.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['token'] = token;
//     return data;
//   }
// }

// class User {
//   String? id;
//   String? name;
//   String? email;
//   String? emailVerifiedAt;
//   String? phone;
//   Null phoneVerifiedAt;
//   String? genre;
//   String? role;
//   String? status;
//   String? createdAt;
//   String? updatedAt;

//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.emailVerifiedAt,
//       this.phone,
//       this.phoneVerifiedAt,
//       this.genre,
//       this.role,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     phone = json['phone'];
//     phoneVerifiedAt = json['phone_verified_at'];
//     genre = json['genre'];
//     role = json['role'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['phone'] = phone;
//     data['phone_verified_at'] = phoneVerifiedAt;
//     data['genre'] = genre;
//     data['role'] = role;
//     data['status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
