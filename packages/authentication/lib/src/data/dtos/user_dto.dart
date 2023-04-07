import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/auth_domain.dart';

class UserDto extends UserEntity {
  const UserDto({
    required super.email,
    required super.id,
    required super.name,
    required super.homeId,
  });

  factory UserDto.empty() {
    return const UserDto(
      homeId: null,
      email: null,
      id: 'qweasadfjqwerupp',
      name: '%%%%%%%%',
    );
  }

  factory UserDto.fromSnapshot(DocumentSnapshot snapshot) {
    return UserDto(
      homeId: snapshot['home_id'] as String?,
      id: snapshot.id,
      email: snapshot['email'] as String,
      name: snapshot['name'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'name': name,
        'home_id': homeId,
      };

  Map<String, dynamic> toSnapshotData() => {
        'email': email,
        'name': name,
        'home_id': homeId,
      };
}
