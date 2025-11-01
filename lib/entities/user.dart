import 'package:equatable/equatable.dart';

enum UserRole { admin, user, contractor, employee, guest }

class AgentiqUser extends Equatable {
  final String id; // AIQ010001 // CompanyCode+Role+Sno
  final String name;
  final String email;
  final String? phoneNumber;
  final String? profilePictureUrl;
  final UserRole role;

  const AgentiqUser({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.profilePictureUrl,
  });

  @override
  List<Object?> get props => [
    id,
    role,
    name,
    email,
    phoneNumber,
    profilePictureUrl,
  ];

  @override
  String toString() {
    return "AgentiqUser(id: $id, role: $role, name: $name, email: $email, phoneNumber: $phoneNumber, profilePictureUrl: $profilePictureUrl)";
  }

  AgentiqUser copyWith({
    String? id,
    UserRole? role,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePictureUrl,
  }) {
    return AgentiqUser(
      id: id ?? this.id,
      role: role ?? this.role,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }
}
