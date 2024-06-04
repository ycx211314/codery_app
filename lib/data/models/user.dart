import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});
}
