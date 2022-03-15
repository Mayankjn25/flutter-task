import 'package:equatable/equatable.dart';

class People extends Equatable {
  late String name;
  late String email;
  late String phoneNo;

  People({
     required this.name,
     required this.email,
     required this.phoneNo,
  });

  People.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone'];
  }

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phoneNo: map['phone'] ?? "",
    );
  }

  @override
  List<Object?> get props => [name, email, phoneNo];
}
