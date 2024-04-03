class UserModel{
  final int? id;
  final String? name;
  final String email;
  final String? password;
  final String? token;

  UserModel({this.id, this.name, required this.email, this.password, this.token});

  factory UserModel.fromJson(Map json){
    return UserModel(
      id:json['id'] ,
      email: json['email'],
      name: json['name'],
      token: json['token'],
    );
  }
  Map<String, String> toJson(){
    return {
      'email': email,
      'password': password!
    };
  }
}