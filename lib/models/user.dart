

class User {
  final String id;
  final String fullName;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String role;
  final DateTime lastActive;
  final String pentrarId;
  final bool isActive;
  final String gender;
  final String status;
  final bool isEmailVerified;
  final int iat;
  final int exp;

  static User? _instance;

  // Private constructor
  User._({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.lastActive,
    required this.pentrarId,
    required this.isActive,
    required this.gender,
    required this.status,
    required this.isEmailVerified,
    required this.iat,
    required this.exp,
  })  : firstName = fullName.split(' ')[0],
        lastName = fullName.split(' ').length > 1
            ? fullName.split(' ')[1]
            : '';

  factory User.getInstance({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? role,
    DateTime? lastActive,
    String? pentrarId,
    bool? isActive,
    String? gender,
    String? status,
    bool? isEmailVerified,
    int? iat,
    int? exp,
  }) {
    _instance ??= User._(
      id: id??'',
      fullName: fullName??'User',
      email: email??'',
      phoneNumber: phoneNumber??'',
      role: role??'',
      lastActive: lastActive??DateTime.now(),
      pentrarId: pentrarId??'',
      isActive: isActive??false,
      gender: gender??'',
      status: status??'',
      isEmailVerified: isEmailVerified??false,
      iat: iat??0,
      exp: exp??0,
    );
    return _instance!;
  }


  factory User.fromJson(Map<String, dynamic> json) {
  _instance ??= User.getInstance(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    role: json['role'],
    lastActive: DateTime.parse(json['last_active']),
    pentrarId: json['pentrar_id'],
    isActive: json['is_active'],
    gender: json['gender'],
    status: json['status'],
    isEmailVerified: json['isEmail_verified'],
    iat: json['iat'],
    exp: json['exp'],
  );
  return _instance!;
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'role': role,
      'last_active': lastActive.toIso8601String(),
      'pentrar_id': pentrarId,
      'is_active': isActive,
      'gender': gender,
      'status': status,
      'isEmail_verified': isEmailVerified,
      'iat': iat,
      'exp': exp,
    };
  }

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? role,
    DateTime? lastActive,
    String? pentrarId,
    bool? isActive,
    String? gender,
    String? status,
    bool? isEmailVerified,
    int? iat,
    int? exp,
  }) {
    return User._(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      lastActive: lastActive ?? this.lastActive,
      pentrarId: pentrarId ?? this.pentrarId,
      isActive: isActive ?? this.isActive,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      iat: iat ?? this.iat,
      exp: exp ?? this.exp,
    );
  }

  // Equality check for User objects
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          fullName == other.fullName &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          role == other.role &&
          lastActive == other.lastActive &&
          pentrarId == other.pentrarId &&
          isActive == other.isActive &&
          gender == other.gender &&
          status == other.status &&
          isEmailVerified == other.isEmailVerified &&
          iat == other.iat &&
          exp == other.exp;

  // Hash code calculation for User objects
  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      role.hashCode ^
      lastActive.hashCode ^
      pentrarId.hashCode ^
      isActive.hashCode ^
      gender.hashCode ^
      status.hashCode ^
      isEmailVerified.hashCode ^
      iat.hashCode ^
      exp.hashCode;
}
