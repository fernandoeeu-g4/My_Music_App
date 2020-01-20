import 'package:hive/hive.dart';

part 'userdata.g.dart';

@HiveType(typeId: 0)
class UserData {
  // Os números de campos antigos não devem mudar ao adicionar
  // campos novos.
  UserData({ this.username, this.email, this.googleId, this.token });
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String googleId;
  @HiveField(3)
  final String token;

}