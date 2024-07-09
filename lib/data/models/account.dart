import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  final String name;
  final String email;
  final String password;
  final String? photoUrl;
  final int fromType;

  Account(
      {required this.name,
      required this.email,
      this.photoUrl,
      required this.password,
      required this.fromType});
}
